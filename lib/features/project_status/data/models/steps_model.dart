import 'package:designsprit/features/project_status/domain/entities/steps.dart';

class StepsModel extends Steps {
  const StepsModel(
      {required super.id,
      required super.stepName,
      required super.status,});

  factory StepsModel.fromJson(Map<String, dynamic> json) => StepsModel(
    id: json["id"],
    stepName: json["stepName"],
    status: json["status"],
  );

}
