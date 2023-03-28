import 'package:designsprit/features/project_status/data/models/steps_model.dart';
import 'package:designsprit/features/project_status/domain/entities/project.dart';
import 'package:designsprit/features/project_status/domain/entities/steps.dart';

class ProjectStepsModel extends ProjectSteps {
  const ProjectStepsModel({
    required super.id,
    required super.projectName,
    required super.steps,
  });

  factory ProjectStepsModel.fromJson(Map<String, dynamic> json) => ProjectStepsModel(
        id: json["id"],
        projectName: json["projectName"],
        steps: List<Steps>.from(json['steps'].map((e) => StepsModel.fromJson(e))),
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["id"] = id;
    map["projectName"] = projectName;
    map["steps"] = steps;
    return map;
  }
}
