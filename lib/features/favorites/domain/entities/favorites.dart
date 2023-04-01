import 'package:equatable/equatable.dart';

class Favorites extends Equatable {
  final String image;
  final String id;

  const Favorites({required this.image, required this.id});

  @override
  List<Object> get props => [image, id];
}
