import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/exceptions.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:designsprit/features/home/domain/entities/home_category_response_data.dart';
import 'package:designsprit/features/home/domain/entities/home_populars_response.dart';
import 'package:designsprit/features/home/domain/entities/home_populars_response_data.dart';
import 'package:designsprit/features/home/domain/repositories/base_home_repo.dart';

class HomeRepo extends BaseHomeRepo {
  final BaseHomeRemoteDataSource baseHomeRemoteDataSource;

  HomeRepo(this.baseHomeRemoteDataSource);

  @override
  Future<Either<Failure, List<HomeCategoryResponseData>>>
      getCategories() async {
    final result = await baseHomeRemoteDataSource.getCategories();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<HomePopularsResponseData>>> getPopularItems() async {
    final result = await baseHomeRemoteDataSource.getPopularItems();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
