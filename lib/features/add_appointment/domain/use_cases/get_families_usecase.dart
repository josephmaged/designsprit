import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/features/add_appointment/domain/entities/families.dart';
import 'package:designsprit/features/add_appointment/domain/repositories/base_appointment_repo.dart';

class GetFamiliesUseCase extends BaseUseCase<List<Families>, NoParameters> {
  final BaseAppointmentRepo baseAppointmentRepo;

  GetFamiliesUseCase(this.baseAppointmentRepo);

  @override
  Future<Either<Failure, List<Families>>> call(NoParameters parameters) async {
    return await baseAppointmentRepo.getFamilies();
  }
}
