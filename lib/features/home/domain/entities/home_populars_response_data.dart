import 'package:equatable/equatable.dart';

class HomePopularsResponseData extends Equatable {
  final List<String>? itemImages;
  final int id;
  final String itemName;
  final String description;
  final int categoryId;

  const HomePopularsResponseData({
    required this.id,
    required this.itemName,
    required this.description,
     this.itemImages,
    required this.categoryId,
  });

  @override
  List<Object?> get props => [
        id,
        itemName,
        description,
        itemImages,
        categoryId,
      ];
}
