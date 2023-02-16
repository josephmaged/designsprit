import 'package:designsprit/features/home/domain/entities/home_category_response.dart';

class HomeCategoryModel extends HomeCategoryResponse {
  const HomeCategoryModel(
      {required super.status, required super.message, required super.data});

  factory HomeCategoryModel.fromJson(dynamic json) => HomeCategoryModel(
      status: json['status'], message: json['message'],
      data: json['data']);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['data'] = data;
    return map;
  }
}
