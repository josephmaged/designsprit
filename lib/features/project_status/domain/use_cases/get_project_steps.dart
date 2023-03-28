import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/features/project_status/domain/entities/project.dart';
import 'package:designsprit/features/project_status/domain/repositories/base_project_steps_repo.dart';
import 'package:equatable/equatable.dart';

class GetProjectStepsUseCase extends BaseUseCase<List<ProjectSteps>, ProjectStepsParameters> {
  final BaseProjectStepsRepo baseProjectStepsRepo;

  GetProjectStepsUseCase(this.baseProjectStepsRepo);

  @override
  Future<Either<Failure, List<ProjectSteps>>> call(ProjectStepsParameters parameters) async {
    return await baseProjectStepsRepo.getProjectSteps(parameters);
  }
}

class ProjectStepsParameters extends Equatable {
  final String fuid;

  const ProjectStepsParameters({required this.fuid});

  @override
  List<Object?> get props => [fuid];
}
