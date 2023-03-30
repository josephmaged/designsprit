import 'package:designsprit/features/item_details/data/models/list_images_model.dart';
import 'package:designsprit/features/item_details/domain/entities/item_images.dart';

class ItemImagesModel extends ItemImages {
  const ItemImagesModel({required super.images});

  factory ItemImagesModel.fromJson(dynamic json) => ItemImagesModel(
        images: List<ListImagesModel>.from(json['itemImages'].map((e) => e)),
      );
}
