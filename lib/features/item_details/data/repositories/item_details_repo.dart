import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/exceptions.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/features/item_details/data/data_sources/ItemDetailsRemoteDataSource.dart';
import 'package:designsprit/features/item_details/domain/entities/item_details.dart';
import 'package:designsprit/features/item_details/domain/entities/item_images.dart';
import 'package:designsprit/features/item_details/domain/repositories/base_item_details_repo.dart';
import 'package:designsprit/features/item_details/domain/use_cases/item_details_usecase.dart';
import 'package:designsprit/features/item_details/domain/use_cases/item_images_usecase.dart';

class ItemDetailsRepo extends BaseItemDetailsRepo {
  final BaseItemDetailsRemoteDataSource baseItemDetailsRemoteDataSource;

  ItemDetailsRepo(this.baseItemDetailsRemoteDataSource);

  @override
  Future<Either<Failure, List<ItemDetails>>> getItemDetails(ItemDetailsParameters parameters) async {
    try {
      final result = await baseItemDetailsRemoteDataSource.getItemDetails(parameters);
      return Right(result);
    } on ServerException catch ( failures){
      return Left(ServerFailure(failures.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<ItemImages>>> getItemImages(ItemImagesParameters parameters) async {
    try {
      final result = await baseItemDetailsRemoteDataSource.getItemImages(parameters);
      return Right(result);
    } on ServerException catch ( failures){
      return Left(ServerFailure(failures.errorMessageModel.statusMessage));
    }
  }


}