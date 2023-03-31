import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/features/add_appointment/domain/entities/regions.dart';
import 'package:designsprit/features/add_appointment/domain/repositories/base_appointment_repo.dart';

class GetRegionsUseCase extends BaseUseCase <List<Regions>, NoParameters> {
  final BaseAppointmentRepo baseAppointmentRepo;

  GetRegionsUseCase(this.baseAppointmentRepo);

  @override
  Future<Either<Failure, List<Regions>>> call(NoParameters parameters) async {
    return await baseAppointmentRepo.getRegions();
  }
}