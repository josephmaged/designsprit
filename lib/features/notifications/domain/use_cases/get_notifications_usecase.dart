import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/features/notifications/domain/entities/notifications.dart';
import 'package:designsprit/features/notifications/domain/repositories/base_notifications_repo.dart';
import 'package:equatable/equatable.dart';

class GetNotificationsUseCase extends BaseUseCase<List<Notifications>, NotificationsParameters> {
  final BaseNotificationsRepo baseNotificationsRepo;

  GetNotificationsUseCase(this.baseNotificationsRepo);

  @override
  Future<Either<Failure, List<Notifications>>> call(NotificationsParameters parameters) async {
    return await baseNotificationsRepo.getNotifications(parameters);
  }
}

class NotificationsParameters extends Equatable {
  final String fuid;

  const NotificationsParameters({required this.fuid});

  @override
  List<Object> get props => [fuid];
}
