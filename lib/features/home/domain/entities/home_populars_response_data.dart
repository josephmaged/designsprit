import 'package:equatable/equatable.dart';

class HomePopularsResponseData extends Equatable {
  final List<String>? itemImages;
  final num? id;
  final String? name;
  final String? description;
  final num? categoryId;

  const HomePopularsResponseData({
    required this.id,
    required this.name,
    required this.description,
    required this.itemImages,
    required this.categoryId,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        itemImages,
        categoryId,
      ];
}
