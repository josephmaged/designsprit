import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/exceptions.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/features/notifications/data/data_sources/notifications_remote_data_source.dart';
import 'package:designsprit/features/notifications/domain/entities/notifications.dart';
import 'package:designsprit/features/notifications/domain/repositories/base_notifications_repo.dart';
import 'package:designsprit/features/notifications/domain/use_cases/get_notifications_usecase.dart';

class NotificationsRepo extends BaseNotificationsRepo{
  final BaseNotificationsRemoteDataSource baseNotificationsRemoteDataSource;

  NotificationsRepo(this.baseNotificationsRemoteDataSource);

  @override
  Future<Either<Failure, List<Notifications>>> getNotifications(NotificationsParameters parameters) async {
    try {
      final result = await baseNotificationsRemoteDataSource.getNotifications(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}