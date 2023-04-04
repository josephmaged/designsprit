import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/utils/api_response.dart';
import 'package:designsprit/features/notifications/domain/entities/notifications.dart';
import 'package:designsprit/features/notifications/domain/use_cases/get_notifications_usecase.dart';
import 'package:designsprit/features/notifications/domain/use_cases/update_notifications_usecase.dart';

abstract class BaseNotificationsRepo {
  Future<Either<Failure, List<Notifications>>> getNotifications(NotificationsParameters parameters);

  Future<Either<Failure, List<ApiResponse>>> updateNotifications(UpdateNotificationsParameters parameters);
}