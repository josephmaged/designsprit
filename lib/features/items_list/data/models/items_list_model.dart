import 'package:designsprit/features/items_list/domain/entities/items_list.dart';

class ItemsListModel extends ItemsList {
  const ItemsListModel({
    required super.id,
    required super.name,
    required super.description,
    required super.category,
    required super.image,
  });

  factory ItemsListModel.fromJson(Map<String, dynamic> json) => ItemsListModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        category: json["category"],
        image: json["itemImage"],
      );
}
