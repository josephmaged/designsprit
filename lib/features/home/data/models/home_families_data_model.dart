import 'package:designsprit/features/home/domain/entities/home_families_response_data.dart';

class HomeFamiliesDataModel extends HomeFamiliesResponseData {
  const HomeFamiliesDataModel(
      {required super.name,
      required super.description,
      required super.image,
      required super.id});

  factory HomeFamiliesDataModel.fromJson(dynamic json) => HomeFamiliesDataModel(
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
