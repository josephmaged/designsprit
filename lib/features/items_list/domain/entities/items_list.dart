import 'package:equatable/equatable.dart';

class ItemsList extends Equatable {
  final int id;
  final String name;
  final String description;
  final String category;
  final String? image;

  const ItemsList({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
     this.image,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        category,
        image,
      ];
}
