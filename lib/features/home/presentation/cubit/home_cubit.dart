import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/features/home/domain/entities/home_families_response_data.dart';
import 'package:designsprit/features/home/domain/entities/home_populars_response_data.dart';
import 'package:designsprit/features/home/domain/use_cases/home_families_use_case.dart';
import 'package:designsprit/features/home/domain/use_cases/home_populars_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.families, this.popular) : super(const HomeState());

  final HomeFamiliesUseCase families;
  final HomePopularsUseCase popular;

  static HomeCubit get(context) => BlocProvider.of(context);

  Future<void> getFamilies() async {
    final result = await families(const NoParameters());

    result.fold((l) {
      emit(state.copyWith(
          randomFamiliesState: RequestState.error,
          randomFamiliesMessage: l.errMessage));
    }, (r) {
      emit(state.copyWith(
          randomFamilies: r, randomFamiliesState: RequestState.loaded));
    });
  }

  Future<void> getIPopulars() async {
    final result = await popular(const NoParameters());

    result.fold((l) {
      emit(state.copyWith(mostPopularState: RequestState.error,
          mostPopularMessage: l.errMessage));
    }, (r) {
      emit(state.copyWith(
          mostPopular: r, mostPopularState: RequestState.loaded));
    });
  }
}
