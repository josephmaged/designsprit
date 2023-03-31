import 'package:designsprit/features/add_appointment/domain/entities/governments.dart';

class GovernmentsModel extends Governments {
  const GovernmentsModel({required super.id, required super.govName});

  factory GovernmentsModel.fromJson(Map<String, dynamic> json) => GovernmentsModel(
        id: json["id"],
        govName: json['governmentName'],
      );
}
