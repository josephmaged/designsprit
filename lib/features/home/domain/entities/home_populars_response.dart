import 'package:equatable/equatable.dart';

import 'home_populars_response_data.dart';

/// status : true
/// message : "success"
/// data : [{"itemImages":["img1"],"id":1,"name":"item1","description":"item of pr 1","categoryId":1,"type":null,"category":null},{"itemImages":["img3"],"id":3,"name":"item3","description":"item of pr 3","categoryId":2,"type":null,"category":null},{"itemImages":["img6"],"id":6,"name":"item6","description":"item of pr 6","categoryId":3,"type":null,"category":null},{"itemImages":["img5"],"id":5,"name":"item5","description":"item of pr 5","categoryId":3,"type":null,"category":null},{"itemImages":["img2"],"id":2,"name":"item2","description":"item of pr 2","categoryId":1,"type":null,"category":null}]

class HomePopularsResponse extends Equatable {
  const HomePopularsResponse(
      {required this.status, required this.message, required this.data});

  final bool status;
  final String message;
  final List<HomePopularsResponseData?>? data;

  @override
  List<Object?> get props => [status, message, data];
}
