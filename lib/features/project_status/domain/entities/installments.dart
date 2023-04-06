import 'package:equatable/equatable.dart';

class Installments extends Equatable {
  final int id;
  final String projectName;
  final double installmentValue;
  final String date;
  final String status;

  const Installments({
    required this.projectName,
    required this.installmentValue,
    required this.date,
    required this.status,
    required this.id,
  });

  @override
  List<Object> get props => [
        id,
        projectName,
        installmentValue,
        date,
        status,
      ];
}
