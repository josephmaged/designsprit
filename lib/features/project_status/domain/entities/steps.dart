import 'package:equatable/equatable.dart';

class Steps extends Equatable{
  final num id;
  final String stepName;
  final String status;
  final String startDate;
  final String endDate;
  final String details;

  const Steps({
    required this.id,
    required this.stepName,
    required this.status,
    required this.startDate,
    required this.endDate,
    required this.details
});

  @override
  List<Object?> get props => [
    id,
    stepName,
    status,
    startDate,
    endDate,
    details
  ];

}