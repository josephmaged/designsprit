import 'package:designsprit/features/home/domain/entities/home_category_response_data.dart';
import 'package:equatable/equatable.dart';

class HomeCategoryResponse extends Equatable {
  final bool? status;
  final String? message;
  final List<dynamic> data;

  const HomeCategoryResponse(
      {required this.status, required this.message, required this.data});

  @override
  List<Object?> get props => [status, message, data];
}
