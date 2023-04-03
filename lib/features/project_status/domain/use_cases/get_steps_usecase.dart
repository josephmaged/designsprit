import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/features/project_status/domain/entities/steps.dart';
import 'package:designsprit/features/project_status/domain/repositories/base_project_steps_repo.dart';
import 'package:equatable/equatable.dart';

class GetStepsUseCase extends BaseUseCase<List<Steps>, StepsParameters> {
  final BaseProjectStepsRepo baseProjectStepsRepo;

  GetStepsUseCase(this.baseProjectStepsRepo);

  @override
  Future<Either<Failure, List<Steps>>> call(StepsParameters parameters) async {
    return await baseProjectStepsRepo.getSteps(parameters);
  }
}

class StepsParameters extends Equatable {
  final int id;

  const StepsParameters({required this.id});

  @override
  List<Object?> get props => [id];
}
