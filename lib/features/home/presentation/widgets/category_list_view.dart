import 'package:designsprit/core/widgets/custom_category_card.dart';
import 'package:designsprit/core/widgets/custom_error_widget.dart';
import 'package:designsprit/core/widgets/custom_loading_indicator.dart';
import 'package:designsprit/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeCategorySuccess) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.categoryModel.data?.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomCategoryCard(
                  icon: state.categoryModel.data?[index]?.image,
                  text: state.categoryModel.data?[index]?.name,
                  press: () {},
                ),
              );
            },
          );
        } else if (state is HomeCategoryFailure) {
          return CustomErrorWidget(errMessage: state.message);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
    return Container();
  }
}
