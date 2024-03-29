import 'package:designsprit/features/add_appointment/domain/entities/categories.dart';

class CategoriesModel extends Categories {
  const CategoriesModel({required super.id, required super.name, required super.familyName});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
        id: json['id'],
        name: json['name'],
        familyName: json['family'],
      );
}
