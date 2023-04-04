import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/features/categories_list/domain/entities/categories.dart';
import 'package:designsprit/features/categories_list/domain/repositories/base_categories_repo.dart';

class GetCategoriesListUseCase extends BaseUseCase<List<Categories>, NoParameters> {
  final BaseCategoriesRepo baseCategoriesRepo;

  GetCategoriesListUseCase(this.baseCategoriesRepo);

  @override
  Future<Either<Failure, List<Categories>>> call(NoParameters parameters) async {
    return await baseCategoriesRepo.getCategoriesList(parameters);
  }
}
