import 'package:designsprit/features/home/domain/entities/home_populars_response_data.dart';

/// itemImages : ["img1"]
/// id : 1
/// name : "item1"
/// description : "item of pr 1"
/// categoryId : 1
/// type : null
/// category : null

class HomePopularsData extends HomePopularsResponseData {
  const HomePopularsData(
      {required super.id,
      required super.name,
      required super.description,
      required super.itemImages,
      required super.categoryId});

  factory HomePopularsData.fromJson(dynamic json) => HomePopularsData(
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
