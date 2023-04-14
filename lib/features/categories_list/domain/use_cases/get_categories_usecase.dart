import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/features/categories_list/domain/entities/categories.dart';
import 'package:designsprit/features/categories_list/domain/repositories/base_categories_repo.dart';
import 'package:equatable/equatable.dart';

class GetCategoriesListUseCase extends BaseUseCase<List<Categories>, CategoriesParameters> {
  final BaseCategoriesRepo baseCategoriesRepo;

  GetCategoriesListUseCase(this.baseCategoriesRepo);

  @override
  Future<Either<Failure, List<Categories>>> call(CategoriesParameters parameters) async {
    return await baseCategoriesRepo.getCategoriesList(parameters);
  }
}


class CategoriesParameters extends Equatable {
  final String id;

  const CategoriesParameters({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}