import 'package:designsprit/features/add_appointment/domain/entities/appointment.dart';

class AppointmentModel extends Appointment {
  const AppointmentModel({
    required super.categoryId,
    required super.area,
    required super.userId,
    required super.countryId,
    required super.governmentId,
    required super.regionId,
    required super.street,
    required super.notes,
    required super.imagesIds,
    required super.timeSheetId,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['categoryId'] = categoryId;
    map['area'] = area;
    map['userId'] = userId;
    map['countryId'] = countryId;
    map['governmentId'] = governmentId;
    map['regionId'] = regionId;
    map['street'] = street;
    map['remarks'] = notes;
    map['imageIds'] = imagesIds;
    map['timeSheetId'] = timeSheetId;
    return map;
  }
}
