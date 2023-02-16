import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/features/home/domain/entities/home_category_response.dart';
import 'package:designsprit/features/home/domain/entities/home_populars_response.dart';

abstract class BaseHomeRepo {
  Future<Either<Failure, HomeCategoryResponse>> getCategories();

  Future<Either<Failure,HomePopularsResponse>> getPopularItems();
}
