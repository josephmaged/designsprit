import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/features/add_appointment/domain/entities/categories.dart';
import 'package:designsprit/features/add_appointment/domain/repositories/base_appointment_repo.dart';

class GetCategoriesUseCase extends BaseUseCase <List<Categories>, NoParameters> {
  final BaseAppointmentRepo baseAppointmentRepo;

  GetCategoriesUseCase(this.baseAppointmentRepo);

  @override
  Future<Either<Failure, List<Categories>>> call(NoParameters parameters) async {
    return await baseAppointmentRepo.getCategories();
  }
}