import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/exceptions.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/features/project_status/data/data_sources/project_tracker_data_source.dart';
import 'package:designsprit/features/project_status/domain/entities/project.dart';
import 'package:designsprit/features/project_status/domain/repositories/base_project_steps_repo.dart';
import 'package:designsprit/features/project_status/domain/use_cases/get_project_steps.dart';

class ProjectStepsRepo extends BaseProjectStepsRepo{
  final BaseProjectStepsDataSource baseProjectStepsDataSource;

  ProjectStepsRepo(this.baseProjectStepsDataSource);

  @override
  Future<Either<Failure, List<ProjectSteps>>> getProjectSteps(ProjectStepsParameters parameters) async {
    try {
      final result = await baseProjectStepsDataSource.getProjectSteps(parameters);
      return Right(result);
    } on ServerException catch (failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}