import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/features/add_appointment/domain/entities/governments.dart';
import 'package:designsprit/features/add_appointment/domain/repositories/base_appointment_repo.dart';

class GetGovernmentsUseCase extends BaseUseCase <List<Governments>, NoParameters> {
  final BaseAppointmentRepo baseAppointmentRepo;

  GetGovernmentsUseCase(this.baseAppointmentRepo);

  @override
  Future<Either<Failure, List<Governments>>> call(NoParameters parameters) async {
    return await baseAppointmentRepo.getGovernments();
  }
}