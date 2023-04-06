import 'package:equatable/equatable.dart';

class Families extends Equatable {
  final int id;
  final String familiesName;

  const Families({required this.id, required this.familiesName});

  @override
  List<Object> get props => [id, familiesName];
}
