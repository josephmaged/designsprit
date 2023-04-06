import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/features/project_status/domain/entities/installments.dart';
import 'package:designsprit/features/project_status/domain/repositories/base_project_steps_repo.dart';
import 'package:equatable/equatable.dart';

class GetInstallmentsUseCase extends BaseUseCase<List<Installments>, GetProjectInstallmentsParameters> {
  final BaseProjectStepsRepo baseProjectStepsRepo;

  GetInstallmentsUseCase(this.baseProjectStepsRepo);

  @override
  Future<Either<Failure, List<Installments>>> call(GetProjectInstallmentsParameters parameters) async {
    return await baseProjectStepsRepo.getProjectInstallments(parameters);
  }
}

class GetProjectInstallmentsParameters extends Equatable {
  final int uid;

  const GetProjectInstallmentsParameters({required this.uid});

  @override
  List<Object> get props => [uid];
}