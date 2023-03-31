import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/exceptions.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/utils/api_response.dart';
import 'package:designsprit/features/add_appointment/data/data_sources/appointment_remote_data_source.dart';
import 'package:designsprit/features/add_appointment/domain/entities/categories.dart';
import 'package:designsprit/features/add_appointment/domain/entities/countries.dart';
import 'package:designsprit/features/add_appointment/domain/entities/governments.dart';
import 'package:designsprit/features/add_appointment/domain/entities/regions.dart';
import 'package:designsprit/features/add_appointment/domain/entities/timeSheet.dart';
import 'package:designsprit/features/add_appointment/domain/repositories/base_appointment_repo.dart';
import 'package:designsprit/features/add_appointment/domain/use_cases/set_appointment.dart';

class AppointmentRepo extends BaseAppointmentRepo{
  final BaseAppointmentRemoteDataSource baseAppointmentRemoteDataSource;

  AppointmentRepo(this.baseAppointmentRemoteDataSource);

  @override
  Future<Either<Failure, List<Categories>>> getCategories() async {
    try {
      final result = await baseAppointmentRemoteDataSource.getCategories();
      return Right(result);
    } on ServerException catch (failures) {
      return Left(ServerFailure(failures.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Countries>>> getCountries() async {
    try {
      final result = await baseAppointmentRemoteDataSource.getCountries();
      return Right(result);
    } on ServerException catch (failures) {
      return Left(ServerFailure(failures.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Governments>>> getGovernments() async {
    try {
      final result = await baseAppointmentRemoteDataSource.getGovernments();
      return Right(result);
    } on ServerException catch (failures) {
      return Left(ServerFailure(failures.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Regions>>> getRegions() async {
    try {
      final result = await baseAppointmentRemoteDataSource.getRegions();
      return Right(result);
    } on ServerException catch (failures) {
      return Left(ServerFailure(failures.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<TimeSheet>>> getTimeSheet() async {
    try {
      final result = await baseAppointmentRemoteDataSource.getTimeSheet();
      return Right(result);
    } on ServerException catch (failures) {
      return Left(ServerFailure(failures.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<ApiResponse>>> setAppointment(AppointmentParameters parameters) async {
    try {
      final result = await baseAppointmentRemoteDataSource.setAppointment(parameters);
      return Right(result);
    } on ServerException catch (failures) {
      return Left(ServerFailure(failures.errorMessageModel.statusMessage));
    }
  }
}