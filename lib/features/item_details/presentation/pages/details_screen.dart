import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:designsprit/constants.dart';
import 'package:designsprit/core/network/api_const.dart';
import 'package:designsprit/core/utils/assets.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/core/utils/strings.dart';
import 'package:designsprit/core/widgets/custom_app_bar.dart';
import 'package:designsprit/core/widgets/custom_loading_indicator.dart';
import 'package:designsprit/features/item_details/presentation/cubit/item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required String itemId});

  @override
  Widget build(BuildContext context) {
    var cubit = ItemCubit.get(context);
    return BlocBuilder<ItemCubit, ItemState>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            titleName: AppStrings.itemsDetails,
            listOfActions: [],
          ),
          body: state.requestState == RequestState.loading
              ? const CustomLoadingIndicator()
              : state.requestState == RequestState.loaded
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Stack(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 60.h,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                state.itemDetailsResponse!.first.name.toUpperCase(),
                                maxLines: 3,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 60.h),
                            child: CarouselSlider(
                              options: CarouselOptions(
                                height: 250.h,
                                enableInfiniteScroll: true,
                                aspectRatio: 16 / 9,
                                viewportFraction: 0.8,
                                initialPage: 0,
                                enlargeCenterPage: true,
                                enlargeFactor: 0.2,
                                scrollDirection: Axis.horizontal,
                              ),
                              items: state.itemImagesResponse!.map((index) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Stack(
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl: ApiConst.getImages(index.imagePath),
                                          errorWidget: (context, url, error) => Image.asset(AssetsData.notFound),
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                        ),
                                        Positioned(
                                          bottom: 10.h,
                                          left: 10.h,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50),
                                              color: kPrimaryColor.withOpacity(0.8),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                                              child: Text(
                                                "Image ID: ${index.imgId}",
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 10.h,
                                          right: 10.h,
                                          child: InkWell(
                                            onTap: () {
                                              cubit.updateItem(
                                                imageId: index.imgId,
                                                isLiked: index.isLiked,
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(50),
                                                color: kPrimaryColor.withOpacity(0.8),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(10.r),
                                                child: Icon(
                                                  index.isLiked == true ? Icons.favorite : Icons.favorite_border,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }).toList(),
                            ),
                          ),
                          Positioned(
                            bottom: 20.h,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppStrings.itemDescription,
                                    maxLines: 100,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                  Text(
                                    state.itemDetailsResponse!.first.description,
                                    maxLines: 100,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : Center(
                      child: Image.asset(AssetsData.notFound),
                    ),
        );
      },
    );
  }
}
