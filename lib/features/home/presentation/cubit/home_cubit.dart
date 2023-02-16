import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/features/home/domain/entities/home_category_response.dart';
import 'package:designsprit/features/home/domain/entities/home_populars_response.dart';
import 'package:designsprit/features/home/domain/use_cases/home_categories_use_case.dart';
import 'package:designsprit/features/home/domain/use_cases/home_populars_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.category, this.popular) : super(HomeInitial());

  final HomeCategoriesUseCase category;
  final HomePopularsUseCase popular;

  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  Future<void> getCategories() async {
    emit(HomeCategoryLoading());

    final result = await category(const NoParameters());

    result.fold((l) {
      emit(HomeCategoryFailure(l.errMessage));
    }, (r) {
      emit(HomeCategorySuccess(r));
    });
  }

  Future<void> getIPopulars() async {
    emit(HomePopularLoading());
    final result = await popular(const NoParameters());

    result.fold((l) => emit(HomePopularFailure(l.errMessage)),
        (r) => emit(HomePopularSuccess(r)));
  }
}
