import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/features/home/domain/entities/home_families_response_data.dart';
import 'package:designsprit/features/home/domain/repositories/base_home_repo.dart';

class HomeFamiliesUseCase extends BaseUseCase<List<HomeFamiliesResponseData>, NoParameters> {

  final BaseHomeRepo baseHomeRepo;

  HomeFamiliesUseCase(this.baseHomeRepo);

  @override
  Future<Either<Failure, List<HomeFamiliesResponseData>>> call(
      NoParameters parameters) async {
    return await baseHomeRepo.getFamilies();
  }
}
