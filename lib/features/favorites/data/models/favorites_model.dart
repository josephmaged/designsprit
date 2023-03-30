import 'package:designsprit/features/favorites/domain/entities/favorites.dart';

class FavoritesModel extends Favorites {
  const FavoritesModel({required super.userName, required super.image});

  factory FavoritesModel.fromJson(Map<String, dynamic> json) => FavoritesModel(
        userName: json['userName'],
        image: json['image'],
      );
}
