import 'package:equatable/equatable.dart';

class Governments extends Equatable {
  final int id;
  final String govName;

  const Governments({
    required this.id,
    required this.govName,
  });

  @override
  List<Object> get props => [id, govName];
}
