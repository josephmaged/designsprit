import 'package:equatable/equatable.dart';

class HomePopularsResponseData extends Equatable {
 const HomePopularsResponseData({
    required this.id,
    required this.name,
    required this.description,
    required this.itemImages,
    required this.categoryId,
  });

  final List<String>? itemImages;
  final num? id;
  final String? name;
  final String? description;
  final num? categoryId;

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
