import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/features/item_details/data/models/list_images_model.dart';
import 'package:designsprit/features/item_details/domain/entities/item_images.dart';
import 'package:designsprit/features/item_details/domain/entities/list_images.dart';
import 'package:designsprit/features/item_details/domain/repositories/base_item_details_repo.dart';
import 'package:equatable/equatable.dart';

class GetItemImagesUseCase extends BaseUseCase<List<ListImages>, ItemImagesParameters> {
  final BaseItemDetailsRepo baseItemDetailsRepo;

  GetItemImagesUseCase(this.baseItemDetailsRepo);

  @override
  Future<Either<Failure, List<ListImages>>> call(ItemImagesParameters parameters) async {
    return await baseItemDetailsRepo.getItemImages(parameters);
  }
}

class ItemImagesParameters extends Equatable {
  final String id;

  const ItemImagesParameters({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
