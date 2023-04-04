import 'package:designsprit/core/widgets/custom_app_bar.dart';
import 'package:designsprit/features/notifications/data/models/notification_model.dart';
import 'package:designsprit/features/notifications/domain/entities/notifications.dart';
import 'package:designsprit/features/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationDetails extends StatelessWidget {
  NotificationsModel notification;

  NotificationDetails({
    Key? key,
    required this.notification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            titleName: notification!.title!,
            count: 0,
            listOfActions: [],
          ),
        );
      },
    );
  }
}
