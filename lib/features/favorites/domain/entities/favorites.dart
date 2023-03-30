import 'package:equatable/equatable.dart';

class Favorites extends Equatable {
  final String userName;
  final String image;

  const Favorites({required this.userName, required this.image});

  @override
  List<Object> get props => [userName, image];
}

