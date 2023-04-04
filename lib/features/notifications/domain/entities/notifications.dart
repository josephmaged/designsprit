import 'package:equatable/equatable.dart';

class Notifications extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final String? createdAt;
  final String? image;

  const Notifications({
    this.title,
    this.description,
    this.createdAt,
    this.image,
    this.id,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        createdAt,
        image,
      ];
}
