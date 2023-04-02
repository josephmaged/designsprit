import 'package:designsprit/core/errors/exceptions.dart';
import 'package:designsprit/core/network/api_const.dart';
import 'package:designsprit/core/network/error_message_model.dart';
import 'package:designsprit/features/notifications/data/models/notification_model.dart';
import 'package:designsprit/features/notifications/domain/use_cases/get_notifications_usecase.dart';
import 'package:dio/dio.dart';

abstract class BaseNotificationsRemoteDataSource {
  Future<List<NotificationsModel>> getNotifications(NotificationsParameters parameters);
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

}
