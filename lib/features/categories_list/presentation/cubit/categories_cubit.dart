import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/features/categories_list/domain/entities/categories.dart';
import 'package:designsprit/features/categories_list/domain/use_cases/get_categories_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final GetCategoriesListUseCase getCategoriesUseCase;

  CategoriesCubit(
    this.getCategoriesUseCase,
  ) : super(const CategoriesState());

  static CategoriesCubit get(context) => BlocProvider.of(context);

  Future<void> getCategories() async {
    final result = await getCategoriesUseCase(const NoParameters() );

    result.fold((l) {
      emit(
        state.copyWith(
          requestState: RequestState.error,
          responseMessage: l.errMessage,
        ),
      );
    }, (r) {
      emit(state.copyWith(
        requestState: RequestState.loaded,
        categoriesList: r,
      ));
    });
  }
}
