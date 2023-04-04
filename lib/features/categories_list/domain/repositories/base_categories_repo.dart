import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/features/categories_list/domain/entities/categories.dart';

abstract class BaseCategoriesRepo {
  Future<Either<Failure, List<Categories>>> getCategoriesList(NoParameters parameters);
}
