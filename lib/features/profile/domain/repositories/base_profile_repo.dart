import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/features/profile/domain/entities/user_data.dart';

abstract class BaseProfileRepo {
  Future<Either<Failure, List<UserData>>> updateUser(UserData parameters);
}
