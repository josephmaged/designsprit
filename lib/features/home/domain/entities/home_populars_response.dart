import 'package:equatable/equatable.dart';

class HomePopularsResponse extends Equatable {
  final bool? status;
  final String? message;
  final List<dynamic> data;

  const HomePopularsResponse(
      {required this.status, required this.message, required this.data});

  @override
  List<Object?> get props => [status, message, data];
}
