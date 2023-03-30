import 'package:bloc/bloc.dart';
import 'package:designsprit/constants.dart';
import 'package:designsprit/core/utils/cache_helper.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/features/favorites/domain/entities/favorites.dart';
import 'package:designsprit/features/favorites/domain/use_cases/get_favorites_usecase.dart';
import 'package:equatable/equatable.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final GetFavoritesUseCase getFavoritesUseCase;

  FavoritesCubit(this.getFavoritesUseCase) : super(const FavoritesState());

  Future<void> getFavorites() async {
    emit(state.copyWith(requestState: RequestState.loading));

    int uid = CacheHelper.getData(key: Constants.userID);

    final result = await getFavoritesUseCase(
      FavoritesParameters(uid: uid),
    );
    result.fold((l) {
      emit(state.copyWith(
        requestState: RequestState.error,
        responseMessage: l.errMessage,
      ));
    }, (r) {
      emit(state.copyWith(
        requestResponse: r,
        requestState: RequestState.loaded
      ));
    });
  }
}
