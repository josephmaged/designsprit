import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/features/profile/domain/entities/user_data.dart';
import 'package:designsprit/features/profile/domain/repositories/base_profile_repo.dart';

class UpdateProfileUseCase extends BaseUseCase<List<UserData>, UserData> {
  final BaseProfileRepo baseProfileRepo;

  UpdateProfileUseCase(this.baseProfileRepo);

  @override
  Future<Either<Failure, List<UserData>>> call(UserData parameters) async {
    return await baseProfileRepo.updateUser(parameters);
  }
}
