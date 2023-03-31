import 'package:bloc/bloc.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/core/utils/api_response.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/features/add_appointment/domain/entities/categories.dart';
import 'package:designsprit/features/add_appointment/domain/entities/countries.dart';
import 'package:designsprit/features/add_appointment/domain/entities/governments.dart';
import 'package:designsprit/features/add_appointment/domain/entities/regions.dart';
import 'package:designsprit/features/add_appointment/domain/entities/timeSheet.dart';
import 'package:designsprit/features/add_appointment/domain/use_cases/get_categories_usecase.dart';
import 'package:designsprit/features/add_appointment/domain/use_cases/get_countries_usecase.dart';
import 'package:designsprit/features/add_appointment/domain/use_cases/get_governments_usecase.dart';
import 'package:designsprit/features/add_appointment/domain/use_cases/get_regions_usecase.dart';
import 'package:designsprit/features/add_appointment/domain/use_cases/get_timesheet_usecase.dart';
import 'package:designsprit/features/add_appointment/domain/use_cases/set_appointment.dart';
import 'package:designsprit/features/add_appointment/presentation/widgets/step_one_view.dart';
import 'package:designsprit/features/add_appointment/presentation/widgets/step_three.dart';
import 'package:designsprit/features/add_appointment/presentation/widgets/step_two_view.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'add_appointment_state.dart';

class AddAppointmentCubit extends Cubit<AddAppointmentState> {
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetCountriesUseCase getCountriesUseCase;
  final GetGovernmentsUseCase getGovernmentsUseCase;
  final GetRegionsUseCase getRegionsUseCase;
  final GetTimeSheetUseCase getTimeSheetUseCase;
  final SetAppointmentUseCase setAppointmentUseCase;

  AddAppointmentCubit(
    this.getCategoriesUseCase,
    this.getCountriesUseCase,
    this.getGovernmentsUseCase,
    this.getRegionsUseCase,
    this.getTimeSheetUseCase,
    this.setAppointmentUseCase,
  ) : super(const AddAppointmentState());

  static AddAppointmentCubit get(context) => BlocProvider.of(context);

  String? categoryValue;
  String? imagesValue;
  String? countryValue;
  String? governmentValue;
  String? regionValue;
  TextEditingController area = TextEditingController();
  TextEditingController notes = TextEditingController();
  TextEditingController street = TextEditingController();

  List<String> categories = [];

  Future<void> getCategories() async {
    emit(state.copyWith(requestState: RequestState.loading));

    final result = await getCategoriesUseCase(const NoParameters());

    result.fold((l) {
      emit(state.copyWith(
        requestState: RequestState.error,
        responseMessage: l.errMessage,
      ));
    }, (r) {
      emit(state.copyWith(
        categoriesResponse: r,
        requestState: RequestState.loaded,
      ));
      categories = r.map((e) => e.name).toList();
    });
  }

  List<String> countries = [];

  Future<void> getCountries() async {
    emit(state.copyWith(requestState: RequestState.loading));

    final result = await getCountriesUseCase(const NoParameters());

    result.fold((l) {
      emit(state.copyWith(
        requestState: RequestState.error,
        responseMessage: l.errMessage,
      ));
    }, (r) {
      emit(state.copyWith(
        countriesResponse: r,
      ));
      countries = r.map((e) => e.countryName).toList();
    });
  }

  List<String> governments = [];

  Future<void> getGovernments() async {
    emit(state.copyWith(requestState: RequestState.loading));

    final result = await getGovernmentsUseCase(const NoParameters());

    result.fold((l) {
      emit(state.copyWith(
        requestState: RequestState.error,
        responseMessage: l.errMessage,
      ));
    }, (r) {
      emit(state.copyWith(
        governmentsResponse: r,
      ));
      governments = r.map((e) => e.govName).toList();
    });
  }

  List<String> regions = [];

  Future<void> getRegions() async {
    emit(state.copyWith(requestState: RequestState.loading));

    final result = await getRegionsUseCase(const NoParameters());

    result.fold((l) {
      emit(state.copyWith(
        requestState: RequestState.error,
        responseMessage: l.errMessage,
      ));
    }, (r) {
      emit(state.copyWith(
        regionsResponse: r,
        requestState: RequestState.loaded,
      ));
      regions = r.map((e) => e.regionName).toList();
    });
  }

  Future<void> getTimeSheet() async {
    emit(state.copyWith(requestState: RequestState.loading));

    final result = await getTimeSheetUseCase(const NoParameters());

    result.fold((l) {
      emit(state.copyWith(
        requestState: RequestState.error,
        responseMessage: l.errMessage,
      ));
    }, (r) {
      emit(state.copyWith(timeSheetResponse: r, requestState: RequestState.loaded));
    });
  }

  /* Future<void> setAppointment() async {
    emit(state.copyWith(requestState: RequestState.loading));

    final result = await setAppointmentUseCase(AppointmentParameters(
      categoryId: categoryId,
      area: area,
      userId: userId,
      countryId: countryId,
      governmentId: governmentId,
      regionId: regionId,
      street: street,
      notes: notes,
      imagesId: imagesId,
      timeSheetId: timeSheetId,
    ));

    result.fold((l) {
      emit(state.copyWith(
        requestState: RequestState.error,
        responseMessage: l.errMessage,
      ));
    }, (r) {
      emit(state.copyWith(
        appointmentResponse: r,
      ));
    });
  }*/

  int currentStep = 0;

  void addStep() {
    currentStep += 1;
    emit(
      state.copyWith(
        currentStep: currentStep,
      ),
    );
  }

  void minusStep() {
    currentStep -= 1;
    emit(
      state.copyWith(
        currentStep: currentStep,
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          title: Text(
            'Project Data',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const StepOne(),
          isActive: currentStep >= 0,
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          title: Text(
            'Address',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: StepTwo(),
          isActive: currentStep >= 1,
        ),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          title: Text(
            'Appointment',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const StepThree(),
          isActive: currentStep >= 2,
        ),
      ];
}
