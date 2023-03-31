import 'package:equatable/equatable.dart';

class TimeSheet extends Equatable {
  final int id;
  final String date;
  final String time;
  final String status;

  const TimeSheet({
    required this.id,
    required this.date,
    required this.time,
    required this.status,
  });

  @override
  List<Object> get props => [id, date, time, status];
}
