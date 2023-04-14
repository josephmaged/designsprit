import 'package:equatable/equatable.dart';

class Categories extends Equatable {
  final int id;
  final String name;

  const Categories({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
