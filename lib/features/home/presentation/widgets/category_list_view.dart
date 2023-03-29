import 'package:designsprit/core/utils/app_router.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/core/widgets/custom_category_card.dart';
import 'package:designsprit/core/widgets/custom_error_widget.dart';
import 'package:designsprit/core/widgets/custom_loading_indicator.dart';
import 'package:designsprit/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        switch (state.randomCategoryState) {
          case RequestState.loading:
            return const CustomLoadingIndicator();
          case RequestState.loaded:
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.randomCategory.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: CustomCategoryCard(
                    image: state.randomCategory[index].image,
                    text: state.randomCategory[index].name,
                    press: () {/*
                      GoRouter.of(context).go("${AppRouter.kItemsListView}/${state.randomCategory[index].id}");*/
                      int categoryId = state.randomCategory[index].id;
                       context.push("${AppRouter.kItemsListView}/$categoryId");
                    },
                  ),
                );
              },
            );
          case RequestState.error:
            return CustomErrorWidget(errMessage: state.randomCategoryMessage);
        }
      },
    );
  }
}
