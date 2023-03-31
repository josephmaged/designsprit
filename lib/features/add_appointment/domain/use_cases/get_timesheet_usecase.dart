import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/features/add_appointment/domain/entities/timeSheet.dart';
import 'package:designsprit/features/add_appointment/domain/repositories/base_appointment_repo.dart';

class GetTimeSheetUseCase extends BaseUseCase <List<TimeSheet>, NoParameters> {
  final BaseAppointmentRepo baseAppointmentRepo;

  GetTimeSheetUseCase(this.baseAppointmentRepo);

  @override
  Future<Either<Failure, List<TimeSheet>>> call(NoParameters parameters) async {
    return await baseAppointmentRepo.getTimeSheet();
  }
}