import 'package:equatable/equatable.dart';

class ListImages extends Equatable {
  final String imagePath;
  final bool isLiked;
  final int imgId;

  const ListImages({required this.imagePath, required this.isLiked, required this.imgId});

  @override
  List<Object> get props => [imagePath, isLiked, imgId];
}
