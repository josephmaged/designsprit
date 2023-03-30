import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/exceptions.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/features/favorites/data/data_sources/favorites_remote_data_source.dart';
import 'package:designsprit/features/favorites/domain/entities/favorites.dart';
import 'package:designsprit/features/favorites/domain/repositories/base_favorites_repo.dart';
import 'package:designsprit/features/favorites/domain/use_cases/get_favorites_usecase.dart';

class FavoritesRepo extends BaseFavoritesRepo {
  final BaseFavoritesRemoteDataSource baseFavoritesRemoteDataSource;

  FavoritesRepo(this.baseFavoritesRemoteDataSource);

  @override
  Future<Either<Failure, List<Favorites>>> getFavorites(FavoritesParameters parameters) async {
    try {
      final result = await baseFavoritesRemoteDataSource.getFavorites(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
