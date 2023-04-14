import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/features/home/domain/entities/home_families_response_data.dart';
import 'package:designsprit/features/home/domain/entities/home_populars_response_data.dart';

abstract class BaseHomeRepo {
  Future<Either<Failure, List<HomeFamiliesResponseData>>> getFamilies();

  Future<Either<Failure,List<HomePopularsResponseData>>> getPopularItems();
}
