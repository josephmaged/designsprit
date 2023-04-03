import 'package:designsprit/features/project_status/domain/entities/project.dart';

class ProjectsModel extends Projects {
  const ProjectsModel({
    required super.id,
    required super.projectName,
  });

  factory ProjectsModel.fromJson(Map<String, dynamic> json) => ProjectsModel(
        id: json["id"],
        projectName: json["name"],
      );

}
