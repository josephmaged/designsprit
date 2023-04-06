import 'dart:isolate';
import 'dart:ui';

import 'package:designsprit/constants.dart';
import 'package:designsprit/core/network/api_const.dart';
import 'package:designsprit/core/utils/strings.dart';
import 'package:designsprit/core/widgets/custom_app_bar.dart';
import 'package:designsprit/core/widgets/custom_primary_button.dart';
import 'package:designsprit/features/project_status/presentation/cubit/status_cubit.dart';
import 'package:enhance_stepper/enhance_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';

class CustomStepper extends StatefulWidget {
  const CustomStepper({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  final ReceivePort _port = ReceivePort();

  @override
  void initState() {
    super.initState();

    IsolateNameServer.registerPortWithName(_port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];
      setState((){ });
    });

    FlutterDownloader.registerCallback(downloadCallback);
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  static void downloadCallback(String id, DownloadTaskStatus status, int progress) {
    final SendPort send = IsolateNameServer.lookupPortByName('downloader_send_port')!;
    send.send([id, status, progress]);
  }

  @override
  Widget build(BuildContext context) {
    var cubit = StatusCubit.get(context);
    return BlocBuilder<StatusCubit, StatusState>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            listOfActions: [],
            titleName: AppStrings.projectTimeline,
          ),
          body: SingleChildScrollView(
            child: EnhanceStepper(
              stepIconSize: 30.h,
              type: cubit.stepType,
              currentStep: cubit.stepIndex,
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                return Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomPrimaryButton(
                          press: () {
                            cubit.updateProjectTracker(stepId: details.stepIndex, status: true);
                            details.onStepContinue;
                          },
                          text: 'ACCEPT',
                          height: 40.h,
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            cubit.updateProjectTracker(stepId: details.stepIndex, status: false);

                            details.onStepCancel;
                          },
                          child: const Text(
                            'REJECT',
                            style: TextStyle(color: kSecondaryColor, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              physics: const ClampingScrollPhysics(),
              steps: Constants.stepsList
                  .map(
                    (e) => EnhanceStep(
                        icon: Icon(
                          Icons.info,
                          size: 30.h,
                        ),
                        state: StepState.editing,
                        isActive: cubit.stepIndex == e.id,
                        title: Text(e.stepName),
                        content: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(e.status),
                        ),
                        subtitle: Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () async {
                              final externalDir = await getExternalStorageDirectory();

                              FlutterDownloader.enqueue(
                                url: ApiConst.attachments(e.attachment!),
                                savedDir: externalDir!.path,
                                fileName: 'download.${e.stepName}',
                                showNotification: true,
                                openFileFromNotification: true,
                              );
                            },
                            child: const Text("Resources"),
                          ),
                        )),
                  )
                  .toList(),
              onStepCancel: () {
                cubit.go(-1, false);
              },
              onStepContinue: () {
                cubit.go(1, true);
              }, /*
              onStepTapped: (index) {
                cubit.stepIndex = index;
                print(index);
              },*/
            ),
          ),
        );
      },
    );
  }
}
