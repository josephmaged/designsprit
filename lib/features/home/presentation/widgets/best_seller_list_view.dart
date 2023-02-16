import 'package:carousel_slider/carousel_slider.dart';
import 'package:designsprit/core/widgets/custom_error_widget.dart';
import 'package:designsprit/core/widgets/custom_loading_indicator.dart';
import 'package:designsprit/features/home/presentation/cubit/home_cubit.dart';
import 'package:designsprit/features/home/presentation/widgets/banner_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomePopularSuccess) {
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
            items: state.homePopularsResponse.data?.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: BannerItem(name: i?.name??"",));
                },
              );
            }).toList(),
          );
        } else if (state is HomeCategoryFailure) {
          return CustomErrorWidget(errMessage: state.message);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
