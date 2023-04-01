import 'package:designsprit/features/favorites/domain/entities/favorites.dart';

class FavoritesModel extends Favorites {
  const FavoritesModel({required super.image, required super.id});

  factory FavoritesModel.fromJson(Map<String, dynamic> json) => FavoritesModel(
        image: json['imageName'],
        id: json['imageId'],
      );
}
