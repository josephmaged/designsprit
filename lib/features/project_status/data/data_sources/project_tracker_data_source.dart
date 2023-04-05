import 'package:designsprit/core/errors/exceptions.dart';
import 'package:designsprit/core/network/api_const.dart';
import 'package:designsprit/core/network/error_message_model.dart';
import 'package:designsprit/core/utils/api_response.dart';
import 'package:designsprit/features/project_status/data/models/project_model.dart';
import 'package:designsprit/features/project_status/data/models/steps_model.dart';
import 'package:designsprit/features/project_status/domain/use_cases/get_steps_usecase.dart';
import 'package:designsprit/features/project_status/domain/use_cases/get_projects_usecase.dart';
import 'package:designsprit/features/project_status/domain/use_cases/update_project_steps_usecase.dart';
import 'package:dio/dio.dart';

abstract class BaseProjectStepsDataSource {
  Future<List<ProjectsModel>> getProjects(ProjectsParameters parameters);

  Future<List<StepsModel>> getSteps(StepsParameters parameters);

  Future<List<ApiResponse>> updateProjectSteps(UpdateProjectStepsParameters parameters);
}

class ProjectStepsRemoteDataSource extends BaseProjectStepsDataSource {
  @override
  Future<List<StepsModel>> getSteps(StepsParameters parameters) async {
    final response = await Dio().get(
      ApiConst.getSteps(projectId: parameters.id),
    );
    if (response.statusCode == 200) {
      if (response.data.containsKey('data')) {
        final data = response.data['data'];
        if (data is List) {
          return data.map((e) => StepsModel.fromJson(e)).toList();
        } else if (data is Map<String, dynamic>) {
          return [StepsModel.fromJson(data)];
        }
      }
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<ApiResponse>> updateProjectSteps(UpdateProjectStepsParameters parameters) async {
    final response = await Dio().post(ApiConst.updateProjectSteps, data: {
      "stepId": parameters.stepId,
      "status": parameters.status,
    });
    if (response.statusCode == 200) {
      final data = response.data;
      if (data is List) {
        return data.map((e) => ApiResponse.fromJson(e)).toList();
      } else if (data is Map<String, dynamic>) {
        return [ApiResponse.fromJson(data)];
      }
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<ProjectsModel>> getProjects(ProjectsParameters parameters) async {
    final response = await Dio().get(
      ApiConst.getProjects(fuId: parameters.fuid),
    );
    if (response.statusCode == 200) {
      if (response.data.containsKey('data')) {
        final data = response.data['data'];
        if (data is List) {
          return data.map((e) => ProjectsModel.fromJson(e)).toList();
        } else if (data is Map<String, dynamic>) {
          return [ProjectsModel.fromJson(data)];
        }
      }
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
