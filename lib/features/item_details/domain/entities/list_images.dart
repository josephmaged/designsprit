import 'package:equatable/equatable.dart';

class ListImages extends Equatable {
  final String imagePath;
  final int imgId;

  const ListImages({required this.imagePath, required this.imgId});

  @override
  List<Object> get props => [imagePath, imgId];
}