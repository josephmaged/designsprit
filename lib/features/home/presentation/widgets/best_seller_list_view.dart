import 'package:carousel_slider/carousel_slider.dart';
import 'package:designsprit/core/utils/app_router.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/core/widgets/custom_error_widget.dart';
import 'package:designsprit/core/widgets/custom_loading_indicator.dart';
import 'package:designsprit/features/home/presentation/cubit/home_cubit.dart';
import 'package:designsprit/core/widgets/banner_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        switch (state.mostPopularState) {
          case RequestState.loading:
            return const CustomLoadingIndicator();
          case RequestState.loaded:
            return CarouselSlider(
              options: CarouselOptions(
                height: 250.0,
                enableInfiniteScroll: true,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.2,
                scrollDirection: Axis.horizontal,
              ),
              items: state.mostPopular.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: BannerItem(
                        name: i.itemName!,
                        image: i.itemImages!,
                      ),
                    );
                  },
                );
              }).toList(),
            );
          case RequestState.error:
            return CustomErrorWidget(errMessage: state.randomCategoryMessage);
        }
      },
    );
  }
}
