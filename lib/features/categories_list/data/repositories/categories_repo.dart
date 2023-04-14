import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/exceptions.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/features/categories_list/data/data_sources/categories_remote_data_source.dart';
import 'package:designsprit/features/categories_list/domain/entities/categories.dart';
import 'package:designsprit/features/categories_list/domain/repositories/base_categories_repo.dart';
import 'package:designsprit/features/categories_list/domain/use_cases/get_categories_usecase.dart';

class CategoriesRepo extends BaseCategoriesRepo {
  final BaseCategoriesRemoteDataSource baseCategoriesRemoteDataSource;

  CategoriesRepo(this.baseCategoriesRemoteDataSource);

  @override
  Future<Either<Failure, List<Categories>>> getCategoriesList(CategoriesParameters parameters) async {
    try {
      final result = await baseCategoriesRemoteDataSource.getCategories(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
