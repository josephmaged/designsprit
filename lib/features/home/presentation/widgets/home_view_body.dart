import 'package:designsprit/core/utils/styles.dart';
import 'package:designsprit/features/home/presentation/widgets/category_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'best_seller_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(15.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Categories',
                  style: Styles.textStyle18,
                ),
                SizedBox(
                  height: 100.h,
                  child: const CategoryListView(),
                ),
                SizedBox(
                  height: 30.h,
                ),
                const Text(
                  'Most Popular',
                  style: Styles.textStyle18,
                ),
              ],
            ),
          ),
        ),
        const SliverFillRemaining(
          child: BestSellerListView(),
        ),
      ],
    );
  }
}
