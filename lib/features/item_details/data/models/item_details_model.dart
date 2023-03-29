import 'package:designsprit/features/item_details/domain/entities/item_details.dart';

class ItemDetailsModel extends ItemDetails {
  ItemDetailsModel({
    required super.id,
    required super.name,
    required super.description,
    required super.category,
  });

  factory ItemDetailsModel.fromJson(dynamic json) => ItemDetailsModel(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    category: json["category"]
  );
}
