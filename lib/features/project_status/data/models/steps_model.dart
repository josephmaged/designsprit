import 'package:designsprit/features/project_status/domain/entities/steps.dart';

class StepsModel extends Steps {
  const StepsModel(
      {required super.id,
      required super.stepName,
      required super.status,
      required super.startDate,
      required super.endDate,
      required super.details});

  factory StepsModel.fromJson(Map<String, dynamic> json) => StepsModel(
    id: json["id"],
    stepName: json["stepName"],
    status: json["status"] ?? "",
    startDate: json["startDate"],
    endDate: json["endDate"],
    details: json["details"],
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["id"] = id;
    map["stepName"] = stepName;
    map["status"] = status;
    map["startDate"] = startDate;
    map["endDate"] = endDate;
    map["details"] = details;
    return map;
  }
}
