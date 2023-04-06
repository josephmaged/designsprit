import 'package:equatable/equatable.dart';

class Categories extends Equatable {
  final int id;
  final String name;
  final String familyName;

  const Categories({
    required this.id,
    required this.name,
    required this.familyName,
  });

  @override
  List<Object> get props => [
        id,
        name,
        familyName,
      ];
}
