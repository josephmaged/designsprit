import 'package:designsprit/features/notifications/domain/entities/notifications.dart';

class NotificationsModel extends Notifications {
  const NotificationsModel({super.id, super.title, super.description, super.createdAt, super.image});

  factory NotificationsModel.fromJson(Map<String, dynamic> json) => NotificationsModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        createdAt: json['createdAt'],
        image: json['image'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'createdAt': createdAt,
        'image': image,
      };
}
