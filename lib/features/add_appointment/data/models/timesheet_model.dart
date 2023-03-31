import 'package:designsprit/features/add_appointment/domain/entities/timeSheet.dart';

class TimeSheetModel extends TimeSheet {
  const TimeSheetModel({required super.id, required super.date, required super.time, required super.status});

  factory TimeSheetModel.fromJson(Map<String, dynamic> json) => TimeSheetModel(
        id: json["id"],
        date: json["date"],
        time: json["time"],
        status: json["status"],
      );
}
