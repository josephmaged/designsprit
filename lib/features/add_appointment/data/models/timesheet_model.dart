import 'package:designsprit/features/add_appointment/domain/entities/timeSheet.dart';

class TimeSheetModel extends TimeSheet {
  const TimeSheetModel({super.id, super.date, super.time, super.status});

  factory TimeSheetModel.fromJson(Map<String, dynamic> json) => TimeSheetModel(
        id: json["id"],
        date: json["date"],
        time: json["time"],
        status: json["status"],
      );
}
