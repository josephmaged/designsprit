import 'package:cached_network_image/cached_network_image.dart';
import 'package:designsprit/constants.dart';
import 'package:designsprit/core/network/api_const.dart';
import 'package:designsprit/core/utils/assets.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/core/utils/strings.dart';
import 'package:designsprit/core/widgets/custom_app_bar.dart';
import 'package:designsprit/core/widgets/custom_loading_indicator.dart';
import 'package:designsprit/features/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleName: AppStrings.notifications,
        listOfActions: const [],
      ),
      body: BlocBuilder<NotificationsCubit, NotificationsState>(
        builder: (context, state) {
          switch (state.requestState) {
            case RequestState.loading:
              return const CustomLoadingIndicator();

            case RequestState.loaded:
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.requestResponse.length,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Stack(
                      children: [],
                    ),
                  );
                },
              );
            case RequestState.error:
              return state.responseMessage == "there is no notefications"
                  ? Center(
                      child: Image.asset(
                        AssetsData.notFound,
                        height: 250.h,
                      ),
                    )
                  : const Center();
          }
        },
      ),
    );
  }
}
