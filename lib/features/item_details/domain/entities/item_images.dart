import 'package:designsprit/features/item_details/domain/entities/list_images.dart';
import 'package:equatable/equatable.dart';

class ItemImages extends Equatable {
  final List<ListImages> images;

  const ItemImages({
    required this.images,
  });

  @override
  List<Object> get props => [images];
}
