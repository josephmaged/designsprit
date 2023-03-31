import 'package:designsprit/features/add_appointment/domain/entities/countries.dart';

class CountriesModel extends Countries {
  const CountriesModel({required super.id, required super.countryName});

  factory CountriesModel.fromJson(Map<String, dynamic> json) => CountriesModel(
        id: json["id"],
        countryName: json["countryName"],
      );
}
