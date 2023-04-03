import 'package:equatable/equatable.dart';

class Projects extends Equatable {
  final int id;
  final String projectName;

  const Projects({
    required this.id,
    required this.projectName,
  });

  @override
  List<Object?> get props => [
        id,
        projectName,
      ];
}
