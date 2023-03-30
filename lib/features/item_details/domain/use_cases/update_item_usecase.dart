import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/core/utils/api_response.dart';
import 'package:designsprit/features/item_details/domain/repositories/base_item_details_repo.dart';
import 'package:equatable/equatable.dart';

class UpdateItemUseCase extends BaseUseCase<List<ApiResponse>, UpdateItemParameters> {
  final BaseItemDetailsRepo baseItemDetailsRepo;

  UpdateItemUseCase(this.baseItemDetailsRepo);

  @override
  Future<Either<Failure, List<ApiResponse>>> call(UpdateItemParameters parameters) async {
    return await baseItemDetailsRepo.updateItem(parameters);
  }
}

class UpdateItemParameters extends Equatable {
  final int uid;
  final int itemImageId;
  final bool isLiked;

  const UpdateItemParameters({
    required this.uid,
    required this.itemImageId,
    required this.isLiked,
  });

  @override
  List<Object> get props => [uid, itemImageId, isLiked];
}
