import 'package:equatable/equatable.dart';

class Notifications extends Equatable {
  final int? id;
  final String? notificationString;

  const Notifications({this.id, this.notificationString});

  @override
  List<Object?> get props => [id, notificationString];
}
