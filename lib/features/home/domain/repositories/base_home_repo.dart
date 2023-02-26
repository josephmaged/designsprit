import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/features/home/domain/entities/home_category_response.dart';
import 'package:designsprit/features/home/domain/entities/home_category_response_data.dart';
import 'package:designsprit/features/home/domain/entities/home_populars_response.dart';
import 'package:designsprit/features/home/domain/entities/home_populars_response_data.dart';

abstract class BaseHomeRepo {
  Future<Either<Failure, List<HomeCategoryResponseData>>> getCategories();

  Future<Either<Failure,List<HomePopularsResponseData>>> getPopularItems();
}
