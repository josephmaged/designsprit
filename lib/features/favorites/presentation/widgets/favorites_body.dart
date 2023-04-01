import 'package:cached_network_image/cached_network_image.dart';
import 'package:designsprit/constants.dart';
import 'package:designsprit/core/network/api_const.dart';
import 'package:designsprit/core/utils/assets.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/core/widgets/custom_loading_indicator.dart';
import 'package:designsprit/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritesBody extends StatelessWidget {
  const FavoritesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        switch (state.requestState) {
          case RequestState.loading:
            return const CustomLoadingIndicator();
          case RequestState.loaded:
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.requestResponse.length,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        placeholder: (context, url) => const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Image(
                          height: 50.h,
                          width: 50.w,
                          image: const AssetImage(AssetsData.imageNotFound),
                        ),
                        imageUrl: ApiConst.getImages(state.requestResponse[index].image),
                        height: 100.h,
                        width: 100.w,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: 1.h,
                        left: 1.h,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                            child: Text(
                              state.requestResponse[index].id,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 10.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
            );
          case RequestState.error:
            return state.responseMessage == "Not Found"
                ? Center(
                    child: Image.asset(
                      AssetsData.notFound,
                      height: 250.h,
                    ),
                  )
                : const Center();
        }
      },
    );
  }
}
