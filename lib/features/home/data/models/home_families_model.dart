import 'package:designsprit/features/home/domain/entities/home_families_response.dart';

class HomeFamiliesModel extends HomeFamiliesResponse {
  const HomeFamiliesModel({
    required super.status,
    required super.message,
    required super.data,
  });

  factory HomeFamiliesModel.fromJson(dynamic json) => HomeFamiliesModel(
        status: json['status'],
        message: json['message'],
        data: List<dynamic>.from(json['data'].map((e) => e)),
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['data'] = data;
    return map;
  }
}
