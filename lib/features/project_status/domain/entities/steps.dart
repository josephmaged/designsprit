import 'package:equatable/equatable.dart';

class Steps extends Equatable {
  final int id;
  final String stepName;
  final String status;
  final String? attachment;

  const Steps({
    required this.id,
    required this.stepName,
    required this.status,
    this.attachment,
  });

  @override
  List<Object?> get props => [
        id,
        stepName,
        status,
        attachment,
      ];
}
