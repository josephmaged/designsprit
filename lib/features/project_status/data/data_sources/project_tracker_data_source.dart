import 'package:designsprit/core/errors/exceptions.dart';
import 'package:designsprit/core/network/api_const.dart';
import 'package:designsprit/core/network/error_message_model.dart';
import 'package:designsprit/features/project_status/data/models/project_model.dart';
import 'package:designsprit/features/project_status/domain/use_cases/get_project_steps.dart';
import 'package:dio/dio.dart';

abstract class BaseProjectStepsDataSource {
  Future<List<ProjectStepsModel>> getProjectSteps(ProjectStepsParameters parameters);
}

class ProjectStepsRemoteDataSource extends BaseProjectStepsDataSource {
  @override
  Future<List<ProjectStepsModel>> getProjectSteps(ProjectStepsParameters parameters) async {
    final response = await Dio().get(
      ApiConst.getProjectSteps(parameters.fuid),
    );
    if (response.statusCode == 200) {
      if (response.data.containsKey('data')) {
        final data = response.data['data'];
        if (data is List) {
          return data.map((e) => ProjectStepsModel.fromJson(e)).toList();
        } else if (data is Map<String, dynamic>) {
          return [ProjectStepsModel.fromJson(data)];
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
