import 'package:designsprit/features/project_status/domain/entities/steps.dart';
import 'package:equatable/equatable.dart';

class ProjectSteps extends Equatable {
  final num id;
  final String projectName;
  final List<Steps> steps;

  const ProjectSteps({
    required this.id,
    required this.projectName,
    required this.steps,
  });

  @override
  List<Object?> get props => [
    id,
    projectName,
    steps,
  ];
}