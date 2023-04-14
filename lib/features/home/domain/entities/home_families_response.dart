import 'package:equatable/equatable.dart';

class HomeFamiliesResponse extends Equatable {
  final bool? status;
  final String? message;
  final List<dynamic> data;

  const HomeFamiliesResponse(
      {required this.status, required this.message, required this.data});

  @override
  List<Object?> get props => [status, message, data];
}
