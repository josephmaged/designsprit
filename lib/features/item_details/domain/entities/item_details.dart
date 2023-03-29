import 'package:equatable/equatable.dart';

class ItemDetails extends Equatable {
  final int id;
  final String name;
  final String description;
  final String category;

  const ItemDetails({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
  });

  @override
  List<Object> get props => [id, name, description, category];
}
