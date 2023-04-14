import 'package:designsprit/core/utils/app_router.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/core/widgets/custom_families_card.dart';
import 'package:designsprit/core/widgets/custom_error_widget.dart';
import 'package:designsprit/core/widgets/custom_loading_indicator.dart';
import 'package:designsprit/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FamiliesListView extends StatelessWidget {
  const FamiliesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        switch (state.randomFamiliesState) {
          case RequestState.loading:
            return const CustomLoadingIndicator();
          case RequestState.loaded:
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.randomFamilies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: CustomFamiliesCard(
                    image: state.randomFamilies[index].image,
                    text: state.randomFamilies[index].name,
                    press: () {
                      int familiesId = state.randomFamilies[index].id;
                      context.push("${AppRouter.kCategoriesView}/$familiesId");
                    },
                  ),
                );
              },
            );
          case RequestState.error:
            return CustomErrorWidget(errMessage: state.randomFamiliesMessage);
        }
      },
    );
  }
}
