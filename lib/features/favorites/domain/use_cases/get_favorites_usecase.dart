import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/features/favorites/domain/entities/favorites.dart';
import 'package:designsprit/features/favorites/domain/repositories/base_favorites_repo.dart';
import 'package:equatable/equatable.dart';

class GetFavoritesUseCase extends BaseUseCase<List<Favorites>, FavoritesParameters> {
  final BaseFavoritesRepo baseFavoritesRepo;

  GetFavoritesUseCase(this.baseFavoritesRepo);

  @override
  Future<Either<Failure, List<Favorites>>> call(FavoritesParameters parameters) async {
    return await baseFavoritesRepo.getFavorites(parameters);
  }
}

class FavoritesParameters extends Equatable {
  final int uid;

  const FavoritesParameters({
    required this.uid,
  });

  @override
  List<Object> get props => [uid];
}
