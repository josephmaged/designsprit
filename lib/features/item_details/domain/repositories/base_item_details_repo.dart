import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/utils/api_response.dart';
import 'package:designsprit/features/item_details/domain/entities/item_details.dart';
import 'package:designsprit/features/item_details/domain/entities/list_images.dart';
import 'package:designsprit/features/item_details/domain/use_cases/item_details_usecase.dart';
import 'package:designsprit/features/item_details/domain/use_cases/item_images_usecase.dart';
import 'package:designsprit/features/item_details/domain/use_cases/update_item_usecase.dart';

abstract class BaseItemDetailsRepo {
  Future<Either<Failure, List<ItemDetails>>> getItemDetails(ItemDetailsParameters parameters);

  Future<Either<Failure, List<ListImages>>> getItemImages(ItemImagesParameters parameters);

  Future<Either<Failure, List<ApiResponse>>> updateItem(UpdateItemParameters parameters);
}
