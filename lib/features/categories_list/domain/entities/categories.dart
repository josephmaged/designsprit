import 'package:equatable/equatable.dart';

class Categories extends Equatable {
  final int id;
  final String name;
  final String description;
  final String? image;

  const Categories({
    required this.id,
    required this.name,
    required this.description,
     this.image,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        image,
      ];
}
