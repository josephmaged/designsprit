import 'package:designsprit/features/add_appointment/domain/entities/regions.dart';

class RegionsModel extends Regions {
  const RegionsModel({required super.id, required super.regionName});

  factory RegionsModel.fromJson(Map<String, dynamic> json) => RegionsModel(
        id: json["id"],
        regionName: json["regionName"],
      );
}
