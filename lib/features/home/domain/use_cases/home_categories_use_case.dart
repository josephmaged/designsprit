import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/features/home/domain/entities/home_category_response_data.dart';
import 'package:designsprit/features/home/domain/repositories/base_home_repo.dart';

class HomeCategoriesUseCase extends BaseUseCase<List<HomeCategoryResponseData>, NoParameters> {

  final BaseHomeRepo baseHomeRepo;

  HomeCategoriesUseCase(this.baseHomeRepo);

  @override
  Future<Either<Failure, List<HomeCategoryResponseData>>> call(
      NoParameters parameters) async {
    return await baseHomeRepo.getCategories();
  }
}
