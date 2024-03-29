import 'package:designsprit/features/home/domain/entities/home_populars_response_data.dart';

class HomePopularsDataModel extends HomePopularsResponseData {
  const HomePopularsDataModel(
      {required super.id,
      required super.itemName,
      required super.description,
      super.itemImages,
      required super.categoryId});

  factory HomePopularsDataModel.fromJson(dynamic json) => HomePopularsDataModel(
        itemImages: List<String>.from(json['itemImages'].map((image) => image)),
        id: json['id'],
        itemName: json['itemName'],
        description: json['description'],
        categoryId: json['categoryId'],
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['itemImages'] = itemImages;
    map['id'] = id;
    map['name'] = itemName;
    map['description'] = description;
    map['categoryId'] = categoryId;
    return map;
  }
}
