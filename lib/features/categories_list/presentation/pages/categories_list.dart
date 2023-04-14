import 'package:cached_network_image/cached_network_image.dart';
import 'package:designsprit/core/network/api_const.dart';
import 'package:designsprit/core/utils/app_router.dart';
import 'package:designsprit/core/utils/assets.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/core/utils/strings.dart';
import 'package:designsprit/core/widgets/custom_app_bar.dart';
import 'package:designsprit/core/widgets/custom_error_widget.dart';
import 'package:designsprit/core/widgets/custom_loading_indicator.dart';
import 'package:designsprit/features/categories_list/presentation/cubit/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    Key? key,
    required String categoryId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = CategoriesCubit.get(context);
    return Scaffold(
      appBar: CustomAppBar(titleName: AppStrings.categories,),
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          switch (state.requestState) {
            case RequestState.loading:
              return const CustomLoadingIndicator();
            case RequestState.loaded:
              return state.categoriesList.isEmpty
                  ? Center(
                      child: Image.asset(
                        AssetsData.notFound,
                        height: 250.h,
                      ),
                    )
                  : ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: state.categoriesList.length,
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            int categoryId = state.categoriesList[index].id;
                            context.push("${AppRouter.kItemsListView}/$categoryId");
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            child: Text(
                              state.categoriesList[index].name,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                            ),
                          ),
                        );
                      },
                    );
            case RequestState.error:
              return CustomErrorWidget(errMessage: state.responseMessage);
          }
        },
      ),
    );
  }
}
