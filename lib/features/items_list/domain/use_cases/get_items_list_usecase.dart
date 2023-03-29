import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/features/items_list/domain/entities/items_list.dart';
import 'package:designsprit/features/items_list/domain/repositories/items_list_repo.dart';
import 'package:equatable/equatable.dart';

class GetItemsListUseCase extends BaseUseCase<List<ItemsList>, GetItemsListParameters> {
  final BaseItemsListRepo baseItemsListRepo;

  GetItemsListUseCase(this.baseItemsListRepo);

  @override
  Future<Either<Failure, List<ItemsList>>> call(GetItemsListParameters parameters) async {
    return await baseItemsListRepo.getItemsList(parameters);
  }
}

class GetItemsListParameters extends Equatable {
  final String categoryId;

  const GetItemsListParameters({
    required this.categoryId,
  });

  @override
  List<Object?> get props => [
        categoryId,
      ];
}
