import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/features/favorites/domain/entities/favorites.dart';
import 'package:designsprit/features/favorites/domain/use_cases/get_favorites_usecase.dart';

abstract class BaseFavoritesRepo {
  Future<Either<Failure, List<Favorites>>> getFavorites(FavoritesParameters parameters);
}