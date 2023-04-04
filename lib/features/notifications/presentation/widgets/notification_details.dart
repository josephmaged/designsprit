import 'package:cached_network_image/cached_network_image.dart';
import 'package:designsprit/core/network/api_const.dart';
import 'package:designsprit/core/utils/assets.dart';
import 'package:designsprit/core/widgets/custom_app_bar.dart';
import 'package:designsprit/features/notifications/data/models/notification_model.dart';
import 'package:designsprit/features/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class NotificationDetails extends StatelessWidget {
  NotificationsModel notification;

  NotificationDetails({
    Key? key,
    required this.notification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String time = notification.createdAt!.split('T').last;
    String timesplit = time.substring(0, 5);
    String day = notification.createdAt!.split('T').first;
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            titleName: notification.title!,
            listOfActions: [],
          ),
          body: Padding(
            padding: EdgeInsets.all(20.r),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    notification.image == null
                        ? Image(
                            height: 50.h,
                            width: 50.w,
                            image: const AssetImage(AssetsData.imageNotFound),
                          )
                        : CachedNetworkImage(
                            placeholder: (context, url) => const CircularProgressIndicator(),
                            errorWidget: (context, url, error) => Image(
                              height: 50.h,
                              width: 50.w,
                              image: const AssetImage(AssetsData.imageNotFound),
                            ),
                            imageUrl: ApiConst.getImages(notification.image!),
                          ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      notification.title!,
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "$day / $timesplit",
                      style: TextStyle(
                        fontSize: 10.sp,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      notification.description!,
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
