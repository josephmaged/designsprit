import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/features/items_list/domain/entities/items_list.dart';
import 'package:designsprit/features/items_list/domain/use_cases/get_items_list_usecase.dart';

abstract class BaseItemsListRepo {
  Future<Either<Failure, List<ItemsList>>> getItemsList(GetItemsListParameters parameters);
}