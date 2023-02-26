import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/features/home/domain/entities/home_populars_response.dart';
import 'package:designsprit/features/home/domain/entities/home_populars_response_data.dart';
import 'package:designsprit/features/home/domain/repositories/base_home_repo.dart';

class HomePopularsUseCase extends BaseUseCase<List<HomePopularsResponseData>, NoParameters> {

  final BaseHomeRepo baseHomeRepo;

  HomePopularsUseCase(this.baseHomeRepo);

  @override
  Future<Either<Failure, List<HomePopularsResponseData>>> call(
      NoParameters parameters) async {
    return await baseHomeRepo.getPopularItems();
  }
}
