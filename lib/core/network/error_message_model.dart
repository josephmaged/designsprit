import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final int? statusCode;
  final String statusMessage;
  final bool? success;

  const ErrorMessageModel({
     this.statusCode,
     required this.statusMessage,
      this.success,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      statusCode: json['status_code'],
      statusMessage: json['message'],
      success: json['success'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw [statusCode, statusMessage, success];
}
