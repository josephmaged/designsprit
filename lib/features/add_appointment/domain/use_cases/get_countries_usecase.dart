import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/features/add_appointment/domain/entities/countries.dart';
import 'package:designsprit/features/add_appointment/domain/repositories/base_appointment_repo.dart';

class GetCountriesUseCase extends BaseUseCase <List<Countries>, NoParameters> {
  final BaseAppointmentRepo baseAppointmentRepo;

  GetCountriesUseCase(this.baseAppointmentRepo);

  @override
  Future<Either<Failure, List<Countries>>> call(NoParameters parameters) async {
    return await baseAppointmentRepo.getCountries();
  }
}