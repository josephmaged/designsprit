import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/exceptions.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/utils/api_response.dart';
import 'package:designsprit/features/project_status/data/data_sources/project_tracker_data_source.dart';
import 'package:designsprit/features/project_status/domain/entities/project.dart';
import 'package:designsprit/features/project_status/domain/entities/steps.dart';
import 'package:designsprit/features/project_status/domain/repositories/base_project_steps_repo.dart';
import 'package:designsprit/features/project_status/domain/use_cases/get_projects_usecase.dart';
import 'package:designsprit/features/project_status/domain/use_cases/get_steps_usecase.dart';
import 'package:designsprit/features/project_status/domain/use_cases/update_project_steps_usecase.dart';

class ProjectStepsRepo extends BaseProjectStepsRepo{
  final BaseProjectStepsDataSource baseProjectStepsDataSource;

  ProjectStepsRepo(this.baseProjectStepsDataSource);

  @override
  Future<Either<Failure, List<Steps>>> getSteps(StepsParameters parameters) async {
    try {
      final result = await baseProjectStepsDataSource.getSteps(parameters);
      return Right(result);
    } on ServerException catch (failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, ApiResponse>> updateProjectSteps(UpdateProjectStepsParameters parameters) async {
    try {
      final result = await baseProjectStepsDataSource.updateProjectSteps(parameters);
      return Right(result);
    } on ServerException catch (failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Projects>>> getProjects(ProjectsParameters parameters) async {
    try {
      final result = await baseProjectStepsDataSource.getProjects(parameters);
      return Right(result);
    } on ServerException catch (failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}