import 'package:bloc/bloc.dart';
import 'package:designsprit/constants.dart';
import 'package:designsprit/core/utils/cache_helper.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/features/notifications/domain/entities/notifications.dart';
import 'package:designsprit/features/notifications/domain/use_cases/get_notifications_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final GetNotificationsUseCase getNotificationsUseCase;

  NotificationsCubit(this.getNotificationsUseCase) : super(const NotificationsState());

  static NotificationsCubit get(context) => BlocProvider.of(context);

  String fuid = CacheHelper.getData(key: Constants.fID);


  Future<void> getNotifications() async {
    emit(state.copyWith(requestState: RequestState.loading));

    final result = await getNotificationsUseCase(
      NotificationsParameters(fuid: 'x9y2a0juJNUuuqVXWtBc6kYqtRt1'),
    );
    result.fold(
      (l) {
        emit(state.copyWith(
          requestState: RequestState.error,
          responseMessage: l.errMessage,
        ));
      },
      (r) {
        emit(state.copyWith(
          requestResponse: r,
          requestState: RequestState.loaded,
        ));
         r.sort((a,b) => b.createdAt!.compareTo(a.createdAt!));
      },
    );
  }
}
