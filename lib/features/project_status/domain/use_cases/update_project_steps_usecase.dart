import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/core/utils/api_response.dart';
import 'package:designsprit/features/project_status/domain/repositories/base_project_steps_repo.dart';
import 'package:equatable/equatable.dart';

class UpdateProjectStepsUseCase extends BaseUseCase<ApiResponse, UpdateProjectStepsParameters> {
  final BaseProjectStepsRepo baseProjectStepsRepo;

  UpdateProjectStepsUseCase(this.baseProjectStepsRepo);

  @override
  Future<Either<Failure, ApiResponse>> call(UpdateProjectStepsParameters parameters) async {
    return await baseProjectStepsRepo.updateProjectSteps(parameters);
  }
}

class UpdateProjectStepsParameters extends Equatable {
  final int stepId;
  final bool status;

  const UpdateProjectStepsParameters({required this.stepId, required this.status});

  @override
  List<Object> get props => [stepId, status];
}