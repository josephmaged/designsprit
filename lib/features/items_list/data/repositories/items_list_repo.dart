import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/exceptions.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/features/items_list/data/data_sources/items_list_remote_data_source.dart';
import 'package:designsprit/features/items_list/domain/entities/items_list.dart';
import 'package:designsprit/features/items_list/domain/repositories/items_list_repo.dart';
import 'package:designsprit/features/items_list/domain/use_cases/get_items_list_usecase.dart';

class ItemsListRepo extends BaseItemsListRepo {
  final BaseItemsListRemoteDataSource baseItemsListRemoteDataSource;

  ItemsListRepo(this.baseItemsListRemoteDataSource);

  @override
  Future<Either<Failure, List<ItemsList>>> getItemsList(GetItemsListParameters parameters) async {
    try {
      final result = await baseItemsListRemoteDataSource.getItemsList(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
