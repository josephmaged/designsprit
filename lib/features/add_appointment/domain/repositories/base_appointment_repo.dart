import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/utils/api_response.dart';
import 'package:designsprit/features/add_appointment/domain/entities/categories.dart';
import 'package:designsprit/features/add_appointment/domain/entities/countries.dart';
import 'package:designsprit/features/add_appointment/domain/entities/families.dart';
import 'package:designsprit/features/add_appointment/domain/entities/governments.dart';
import 'package:designsprit/features/add_appointment/domain/entities/regions.dart';
import 'package:designsprit/features/add_appointment/domain/entities/timeSheet.dart';
import 'package:designsprit/features/add_appointment/domain/use_cases/get_categories_usecase.dart';
import 'package:designsprit/features/add_appointment/domain/use_cases/set_appointment.dart';

abstract class BaseAppointmentRepo {
  Future<Either<Failure, List<Families>>> getFamilies();

  Future<Either<Failure, List<Categories>>> getCategories(GetCategoriesParameters parameters);

  Future<Either<Failure, List<Countries>>> getCountries();

  Future<Either<Failure, List<Governments>>> getGovernments();

  Future<Either<Failure, List<Regions>>> getRegions();

  Future<Either<Failure, List<TimeSheet>>> getTimeSheet();

  Future<Either<Failure, List<ApiResponse>>> setAppointment(AppointmentParameters parameters);
}
