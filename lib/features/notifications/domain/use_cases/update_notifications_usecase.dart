import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/core/utils/api_response.dart';
import 'package:designsprit/features/notifications/domain/repositories/base_notifications_repo.dart';
import 'package:equatable/equatable.dart';

class UpdateNotificationsUseCase extends BaseUseCase<List<ApiResponse>, UpdateNotificationsParameters> {
  final BaseNotificationsRepo baseNotificationsRepo;

  UpdateNotificationsUseCase(this.baseNotificationsRepo);

  @override
  Future<Either<Failure, List<ApiResponse>>> call(UpdateNotificationsParameters parameters) async {
    return await baseNotificationsRepo.updateNotifications(parameters);
  }
}

class UpdateNotificationsParameters extends Equatable {
  final String notificationId;

  const UpdateNotificationsParameters({required this.notificationId});

  @override
  List<Object> get props => [notificationId];
}