import 'package:cached_network_image/cached_network_image.dart';
import 'package:designsprit/core/network/api_const.dart';
import 'package:designsprit/core/utils/app_router.dart';
import 'package:designsprit/core/utils/assets.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/core/widgets/custom_error_widget.dart';
import 'package:designsprit/core/widgets/custom_loading_indicator.dart';
import 'package:designsprit/features/items_list/presentation/cubit/items_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ItemsListView extends StatelessWidget {
  const ItemsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemsListCubit, ItemsListState>(
      builder: (context, state) {
        switch (state.requestState) {
          case RequestState.loading:
            return const CustomLoadingIndicator();
          case RequestState.loaded:
            return state.itemsList!.isEmpty
                ? Center(
                    child: Image.asset(
                      AssetsData.notFound,
                      height: 250.h,
                    ),
                  )
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.itemsList!.length,
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          int itemId = state.itemsList![index].id;
                          context.push("${AppRouter.kItemDetailsView}/$itemId");
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              state.itemsList![index].image == null
                                  ? Image.asset(
                                      AssetsData.imageNotFound,
                                      width: 100.w,
                                      height: 100.h,
                                    )
                                  : CachedNetworkImage(
                                      placeholder: (context, url) => const CircularProgressIndicator(),
                                      errorWidget: (context, url, error) => Image(
                                        height: 50.h,
                                        width: 50.w,
                                        image: const AssetImage(AssetsData.imageNotFound),
                                      ),
                                      imageUrl: ApiConst.getImages(state.itemsList![index].image!),
                                      height: 100.h,
                                      width: 100.w,
                                      fit: BoxFit.cover,
                                    ),
                              SizedBox(
                                width: 20.w,
                              ),
                              SizedBox(
                                width: 230.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.itemsList![index].name,
                                      maxLines: 2,
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      state.itemsList![index].description,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
          case RequestState.error:
            return CustomErrorWidget(errMessage: state.responseMessage);
        }
      },
    );
  }
}
