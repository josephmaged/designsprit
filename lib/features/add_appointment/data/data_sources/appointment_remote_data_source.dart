import 'package:designsprit/core/errors/exceptions.dart';
import 'package:designsprit/core/network/api_const.dart';
import 'package:designsprit/core/network/error_message_model.dart';
import 'package:designsprit/core/utils/api_response.dart';
import 'package:designsprit/features/add_appointment/data/models/categories_model.dart';
import 'package:designsprit/features/add_appointment/data/models/countries_model.dart';
import 'package:designsprit/features/add_appointment/data/models/governments_model.dart';
import 'package:designsprit/features/add_appointment/data/models/regions_model.dart';
import 'package:designsprit/features/add_appointment/data/models/timesheet_model.dart';
import 'package:designsprit/features/add_appointment/domain/use_cases/set_appointment.dart';
import 'package:dio/dio.dart';

abstract class BaseAppointmentRemoteDataSource {
  Future<List<CategoriesModel>> getCategories();

  Future<List<CountriesModel>> getCountries();

  Future<List<GovernmentsModel>> getGovernments();

  Future<List<RegionsModel>> getRegions();

  Future<List<TimeSheetModel>> getTimeSheet();

  Future<List<ApiResponse>> setAppointment(AppointmentParameters parameters);
}

class AppointmentRemoteDataSource extends BaseAppointmentRemoteDataSource {
  @override
  Future<List<CategoriesModel>> getCategories() async {
    final response = await Dio().get(
      ApiConst.getCategories,
    );

    if (response.statusCode == 200) {
      if (response.data.containsKey('data')) {
        final data = response.data['data'];
        if (data is List) {
          return data.map((e) => CategoriesModel.fromJson(e)).toList();
        } else if (data is Map<String, dynamic>) {
          return [CategoriesModel.fromJson(data)];
        }
      }
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<CountriesModel>> getCountries() async {
    final response = await Dio().get(
      ApiConst.getCountries,
    );

    if (response.statusCode == 200) {
      if (response.data.containsKey('data')) {
        final data = response.data['data'];
        if (data is List) {
          return data.map((e) => CountriesModel.fromJson(e)).toList();
        } else if (data is Map<String, dynamic>) {
          return [CountriesModel.fromJson(data)];
        }
      }
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<GovernmentsModel>> getGovernments() async {
    final response = await Dio().get(
      ApiConst.getGovernments,
    );

    if (response.statusCode == 200) {
      if (response.data.containsKey('data')) {
        final data = response.data['data'];
        if (data is List) {
          return data.map((e) => GovernmentsModel.fromJson(e)).toList();
        } else if (data is Map<String, dynamic>) {
          return [GovernmentsModel.fromJson(data)];
        }
      }
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<RegionsModel>> getRegions() async {
    final response = await Dio().get(
      ApiConst.getRegions,
    );

    if (response.statusCode == 200) {
      if (response.data.containsKey('data')) {
        final data = response.data['data'];
        if (data is List) {
          return data.map((e) => RegionsModel.fromJson(e)).toList();
        } else if (data is Map<String, dynamic>) {
          return [RegionsModel.fromJson(data)];
        }
      }
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<TimeSheetModel>> getTimeSheet() async {
    final response = await Dio().get(
      ApiConst.getTimeSheet,
    );

    if (response.statusCode == 200) {
      if (response.data.containsKey('data')) {
        final data = response.data['data'];
        if (data is List) {
          return data.map((e) => TimeSheetModel.fromJson(e)).toList();
        } else if (data is Map<String, dynamic>) {
          return [TimeSheetModel.fromJson(data)];
        }
      }
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<ApiResponse>> setAppointment(AppointmentParameters parameters) async {
    final response = await Dio().post(
      ApiConst.setAppointment,
      data: {
        "categoryId": parameters.categoryId,
        "area": parameters.area,
        "userId": parameters.userId,
        "countryId": parameters.countryId,
        "governmentId": parameters.governmentId,
        "regionId": parameters.regionId,
        "street": parameters.street,
        "remarks": parameters.notes,
        "imageIds": parameters.imagesId,
        "timeSheetId": parameters.timeSheetId,
      },
      options: Options(
        headers: {
          "Content-Type": 'application/json',
          'Accept': '*/*',
        },
      ),
    );

    if (response.statusCode == 200) {
      final data = response.data;
      if (data is List) {
        return data.map((e) => ApiResponse.fromJson(e)).toList();
      } else if (data is Map<String, dynamic>) {
        return [ApiResponse.fromJson(data)];
      }
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
