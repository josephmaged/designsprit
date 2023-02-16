import 'package:designsprit/features/home/domain/entities/home_category_response_data.dart';

class HomeCategoryData extends HomeCategoryResponseData {
  const HomeCategoryData(
      {required super.name,
      required super.description,
      required super.image,
      required super.id});

  factory HomeCategoryData.fromJson(dynamic json) => HomeCategoryData(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image']);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['image'] = image;

    return map;
  }
}
