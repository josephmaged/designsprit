import 'package:equatable/equatable.dart';

class ItemImages extends Equatable {
  final List<String> images;

  const ItemImages({
    required this.images,
  });

  @override
  List<Object> get props => [images];
}
