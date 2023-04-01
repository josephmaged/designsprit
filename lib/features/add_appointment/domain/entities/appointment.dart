import 'package:equatable/equatable.dart';

class Appointment extends Equatable {
  final String categoryId;
  final String area;
  final int userId;
  final String countryId;
  final String governmentId;
  final String regionId;
  final String street;
  final String notes;
  final List<String> imagesIds;
  final int timeSheetId;

  const Appointment({
    required this.categoryId,
    required this.area,
    required this.userId,
    required this.countryId,
    required this.governmentId,
    required this.regionId,
    required this.street,
    required this.notes,
    required this.imagesIds,
    required this.timeSheetId,
  });

  @override
  List<Object> get props => [
        categoryId,
        area,
        userId,
        countryId,
        governmentId,
        regionId,
        street,
        notes,
        imagesIds,
        timeSheetId,
      ];
}
