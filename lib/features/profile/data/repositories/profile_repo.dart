import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/exceptions.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:designsprit/features/profile/domain/entities/user_data.dart';
import 'package:designsprit/features/profile/domain/repositories/base_profile_repo.dart';

class ProfileRepo extends BaseProfileRepo {
  final BaseProfileRemoteDataSource baseProfileRemoteDataSource;

  ProfileRepo(this.baseProfileRemoteDataSource);

  @override
  Future<Either<Failure, List<UserData>>> updateUser(UserData parameters) async {
    try {
      final result = await baseProfileRemoteDataSource.updateUserData(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
