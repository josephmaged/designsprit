import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/features/item_details/domain/entities/item_details.dart';
import 'package:designsprit/features/item_details/domain/repositories/base_item_details_repo.dart';
import 'package:equatable/equatable.dart';

class GetItemDetailsUseCase extends BaseUseCase<List<ItemDetails>, ItemDetailsParameters> {
  final BaseItemDetailsRepo baseItemDetailsRepo;

  GetItemDetailsUseCase(this.baseItemDetailsRepo);

  @override
  Future<Either<Failure, List<ItemDetails>>> call(ItemDetailsParameters parameters) async {
    return await baseItemDetailsRepo.getItemDetails(parameters);
  }
}

class ItemDetailsParameters extends Equatable {
  final String id;

  const ItemDetailsParameters({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
