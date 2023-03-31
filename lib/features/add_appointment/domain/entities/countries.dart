import 'package:equatable/equatable.dart';

class Countries extends Equatable {
  final int id;
  final String countryName;

  const Countries({
    required this.id,
    required this.countryName,
  });

  @override
  List<Object> get props => [id, countryName];
}