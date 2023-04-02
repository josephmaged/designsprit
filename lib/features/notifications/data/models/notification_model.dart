import 'package:designsprit/features/notifications/domain/entities/notifications.dart';

class NotificationsModel extends Notifications {
  const NotificationsModel({super.id, super.notificationString});

  factory NotificationsModel.fromJson(Map<String, dynamic> json) => NotificationsModel(
        id: json['id'],
        notificationString: json['notification'],
      );
}
