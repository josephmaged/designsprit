import 'package:equatable/equatable.dart';

class Regions extends Equatable {
  final int id;
  final String regionName;

  const Regions({
    required this.id,
    required this.regionName,
  });

  @override
  List<Object> get props => [id, regionName];
}
