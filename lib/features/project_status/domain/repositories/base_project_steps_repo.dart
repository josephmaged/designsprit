import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/utils/api_response.dart';
import 'package:designsprit/features/project_status/domain/entities/installments.dart';
import 'package:designsprit/features/project_status/domain/entities/project.dart';
import 'package:designsprit/features/project_status/domain/entities/steps.dart';
import 'package:designsprit/features/project_status/domain/use_cases/get_installments_usecase.dart';
import 'package:designsprit/features/project_status/domain/use_cases/get_steps_usecase.dart';
import 'package:designsprit/features/project_status/domain/use_cases/get_projects_usecase.dart';
import 'package:designsprit/features/project_status/domain/use_cases/update_project_steps_usecase.dart';

abstract class BaseProjectStepsRepo {
  Future<Either<Failure, List<Projects>>> getProjects(ProjectsParameters parameters);

  Future<Either<Failure, List<Steps>>> getSteps(StepsParameters parameters);

  Future<Either<Failure, List<ApiResponse>>> updateProjectSteps(UpdateProjectStepsParameters parameters);

  Future<Either<Failure, List<Installments>>> getProjectInstallments(GetProjectInstallmentsParameters parameters);
}
