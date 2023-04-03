import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/features/project_status/domain/entities/project.dart';
import 'package:designsprit/features/project_status/domain/repositories/base_project_steps_repo.dart';
import 'package:equatable/equatable.dart';

class GetProjectsUseCase extends BaseUseCase<List<Projects>, ProjectsParameters>{
  final BaseProjectStepsRepo baseProjectStepsRepo;

  GetProjectsUseCase(this.baseProjectStepsRepo);

  @override
  Future<Either<Failure, List<Projects>>> call(ProjectsParameters parameters) async {
    return await baseProjectStepsRepo.getProjects(parameters);
  }

}


class ProjectsParameters extends Equatable {
  final String fuid;

  const ProjectsParameters({required this.fuid});

  @override
  List<Object?> get props => [fuid];
}
