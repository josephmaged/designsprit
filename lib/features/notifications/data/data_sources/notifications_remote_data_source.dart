import 'package:designsprit/core/errors/exceptions.dart';
import 'package:designsprit/core/network/api_const.dart';
import 'package:designsprit/core/network/error_message_model.dart';
import 'package:designsprit/core/utils/api_response.dart';
import 'package:designsprit/features/notifications/data/models/notification_model.dart';
import 'package:designsprit/features/notifications/domain/use_cases/get_notifications_usecase.dart';
import 'package:designsprit/features/notifications/domain/use_cases/update_notifications_usecase.dart';
import 'package:dio/dio.dart';

abstract class BaseNotificationsRemoteDataSource {
  Future<List<NotificationsModel>> getNotifications(NotificationsParameters parameters);

  Future<List<ApiResponse>> updateNotifications(UpdateNotificationsParameters parameters);
}

class NotificationsRemoteDataSource extends BaseNotificationsRemoteDataSource{
  @override
  Future<List<NotificationsModel>> getNotifications(NotificationsParameters parameters) async {
    final response = await Dio().get(
      ApiConst.getNotifications(parameters.fuid),
    );
    if (response.statusCode == 200) {
      if (response.data.containsKey('data')) {
        final data = response.data['data'];
        if (data is List) {
          return data.map((e) => NotificationsModel.fromJson(e)).toList();
        } else if (data is Map<String, dynamic>) {
          return [NotificationsModel.fromJson(data)];
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
  Future<List<ApiResponse>> updateNotifications(UpdateNotificationsParameters parameters) async {
    final response = await Dio().post(
      ApiConst.updateNotifications(parameters.notificationId),
    );
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

}
