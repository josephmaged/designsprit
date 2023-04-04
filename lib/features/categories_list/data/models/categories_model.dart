import 'package:designsprit/features/categories_list/domain/entities/categories.dart';

class CategoriesModel extends Categories {
  const CategoriesModel({
    required super.id,
    required super.name,
    required super.description,
    required super.image,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["itemImage"],
      );
}
