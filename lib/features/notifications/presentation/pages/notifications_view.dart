import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:designsprit/core/network/api_const.dart';
import 'package:designsprit/core/utils/app_router.dart';
import 'package:designsprit/core/utils/assets.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/core/utils/strings.dart';
import 'package:designsprit/core/widgets/custom_app_bar.dart';
import 'package:designsprit/core/widgets/custom_loading_indicator.dart';
import 'package:designsprit/features/notifications/data/models/notification_model.dart';
import 'package:designsprit/features/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:designsprit/features/notifications/presentation/widgets/notification_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Notifications extends StatelessWidget {
  const Notifications({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = NotificationsCubit.get(context);
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
              return RefreshIndicator(
                onRefresh: () => cubit.getNotifications(),
                child: ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: state.requestResponse.length,
                  padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 12.h),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: InkWell(
                        onTap: () {
                          NotificationsModel notification = NotificationsModel(
                            id: state.requestResponse[index].id,
                            title: state.requestResponse[index].title,
                            image: state.requestResponse[index].image,
                            createdAt: state.requestResponse[index].createdAt,
                            description: state.requestResponse[index].description,
                          ) ;
                          context.push(AppRouter.kNotificationDetailsView, extra: notification);
                        },
                        child: SizedBox(
                          height: 60.h,
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.requestResponse[index].title!,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      state.requestResponse[index].createdAt!,
                                      style: TextStyle(fontSize: 10.sp),
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Expanded(
                                      child: Text(
                                        state.requestResponse[index].description!,
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                        ),
                                        maxLines: 2,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              state.requestResponse[index].image == null
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
                                      imageUrl: ApiConst.getImages(state.requestResponse[index].image!),
                                      height: 50.h,
                                      width: 50.w,
                                    ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      thickness: 0.2,
                    );
                  },
                ),
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
