import 'package:equatable/equatable.dart';

class HomeFamiliesResponseData extends Equatable {
  final int id;
  final String name;
  final String description;
  final String image;

  const HomeFamiliesResponseData({
    required this.name,
    required this.description,
    required this.image,
    required this.id,
  });

  @override
  List<Object> get props => [
        id,
        name,
        description,
        image,
      ];
}
