import 'package:designsprit/features/home/domain/entities/home_populars_response.dart';

/// status : true
/// message : "success"
/// data : [{"itemImages":["img1"],"id":1,"name":"item1","description":"item of pr 1","categoryId":1,"type":null,"category":null},{"itemImages":["img3"],"id":3,"name":"item3","description":"item of pr 3","categoryId":2,"type":null,"category":null},{"itemImages":["img6"],"id":6,"name":"item6","description":"item of pr 6","categoryId":3,"type":null,"category":null},{"itemImages":["img5"],"id":5,"name":"item5","description":"item of pr 5","categoryId":3,"type":null,"category":null},{"itemImages":["img2"],"id":2,"name":"item2","description":"item of pr 2","categoryId":1,"type":null,"category":null}]

class HomePopularsModel extends HomePopularsResponse {
  const HomePopularsModel(
      {required super.status, required super.message, required super.data});

  factory HomePopularsModel.fromJson(dynamic json) => HomePopularsModel(
      status: json['status'], message: json['message'], data: json['data']);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['data'] = data;

    return map;
  }
}
