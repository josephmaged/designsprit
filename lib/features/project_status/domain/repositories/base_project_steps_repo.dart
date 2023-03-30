import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/utils/api_response.dart';
import 'package:designsprit/features/project_status/domain/entities/project.dart';
import 'package:designsprit/features/project_status/domain/use_cases/get_project_steps.dart';
import 'package:designsprit/features/project_status/domain/use_cases/update_project_steps.dart';

abstract class BaseProjectStepsRepo {
  Future<Either<Failure, List<ProjectSteps>>> getProjectSteps(ProjectStepsParameters parameters);

  Future<Either<Failure, ApiResponse>> updateProjectSteps(UpdateProjectStepsParameters parameters);
}