import 'package:designsprit/features/home/domain/entities/home_populars_response_data.dart';

class HomePopularsDataModel extends HomePopularsResponseData {
  const HomePopularsDataModel(
      {required super.id,
      required super.name,
      required super.description,
      required super.itemImages,
      required super.categoryId});

  factory HomePopularsDataModel.fromJson(dynamic json) => HomePopularsDataModel(
        itemImages:
            json['itemImages'] != null ? json['itemImages'].cast<String>() : [],
        id: json['id'],
        name: json['name'],
        description: json['description'],
        categoryId: json['categoryId'],
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['itemImages'] = itemImages;
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['categoryId'] = categoryId;
    return map;
  }
}
