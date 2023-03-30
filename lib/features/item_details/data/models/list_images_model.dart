import 'package:designsprit/features/item_details/domain/entities/list_images.dart';

class ListImagesModel extends ListImages {
  const ListImagesModel({required super.imagePath, required super.imgId});

  factory ListImagesModel.fromJson(dynamic json) => ListImagesModel(
        imagePath: json['imagePath'],
        imgId: json['id'],
      );
}
