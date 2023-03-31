import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/core/utils/api_response.dart';
import 'package:designsprit/features/add_appointment/domain/repositories/base_appointment_repo.dart';
import 'package:equatable/equatable.dart';

class SetAppointmentUseCase extends BaseUseCase<List<ApiResponse>, AppointmentParameters> {
  final BaseAppointmentRepo baseAppointmentRepo;

  SetAppointmentUseCase(this.baseAppointmentRepo);

  @override
  Future<Either<Failure, List<ApiResponse>>> call(AppointmentParameters parameters) async {
    return await baseAppointmentRepo.setAppointment(parameters);
  }
}

class AppointmentParameters extends Equatable {
  final int categoryId;
  final int area;
  final int userId;
  final int countryId;
  final int governmentId;
  final int regionId;
  final String street;
  final String notes;
  final List<int> imagesId;
  final int timeSheetId;

  const AppointmentParameters({
    required this.categoryId,
    required this.area,
    required this.userId,
    required this.countryId,
    required this.governmentId,
    required this.regionId,
    required this.street,
    required this.notes,
    required this.imagesId,
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
        imagesId,
        timeSheetId,
      ];
}
