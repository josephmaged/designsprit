import 'package:designsprit/features/add_appointment/domain/entities/families.dart';

class FamiliesModel extends Families {
  const FamiliesModel({required super.id, required super.familiesName});

  factory FamiliesModel.fromJson(Map<String, dynamic> json) => FamiliesModel(
        id: json['id'],
        familiesName: json['name'],
      );
}
