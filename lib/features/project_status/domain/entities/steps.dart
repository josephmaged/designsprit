import 'package:equatable/equatable.dart';

class Steps extends Equatable {
  final int id;
  final String stepName;
  final String status;

  const Steps({
    required this.id,
    required this.stepName,
    required this.status,
  });

  @override
  List<Object?> get props => [
        id,
        stepName,
        status,
      ];
}
