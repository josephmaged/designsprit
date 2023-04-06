import 'package:designsprit/constants.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/core/utils/api_response.dart';
import 'package:designsprit/core/utils/cache_helper.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/features/add_appointment/domain/entities/categories.dart';
import 'package:designsprit/features/add_appointment/domain/entities/countries.dart';
import 'package:designsprit/features/add_appointment/domain/entities/families.dart';
import 'package:designsprit/features/add_appointment/domain/entities/governments.dart';
import 'package:designsprit/features/add_appointment/domain/entities/regions.dart';
import 'package:designsprit/features/add_appointment/domain/entities/timeSheet.dart';
import 'package:designsprit/features/add_appointment/domain/use_cases/get_categories_usecase.dart';
import 'package:designsprit/features/add_appointment/domain/use_cases/get_countries_usecase.dart';
import 'package:designsprit/features/add_appointment/domain/use_cases/get_families_usecase.dart';
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
import 'package:fluttertoast/fluttertoast.dart';

part 'add_appointment_state.dart';

class AddAppointmentCubit extends Cubit<AddAppointmentState> {
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetCountriesUseCase getCountriesUseCase;
  final GetGovernmentsUseCase getGovernmentsUseCase;
  final GetRegionsUseCase getRegionsUseCase;
  final GetTimeSheetUseCase getTimeSheetUseCase;
  final SetAppointmentUseCase setAppointmentUseCase;
  final GetFamiliesUseCase getFamiliesUseCase;

  AddAppointmentCubit(
      this.getCategoriesUseCase,
      this.getCountriesUseCase,
      this.getGovernmentsUseCase,
      this.getRegionsUseCase,
      this.getTimeSheetUseCase,
      this.setAppointmentUseCase,
      this.getFamiliesUseCase,
      ) : super(AddAppointmentState(
    categoryValue: 0,
    countryValue: 0,
    governmentValue: 0,
    regionValue: 0,
    timeSheetValue: 0,
  ));

  static AddAppointmentCubit get(context) => BlocProvider.of(context);

  /*String? categoryValue;
  String? countryValue;
  String? governmentValue;
  String? regionValue;
  int? timeSheetValue;*/

  List<String> selectedFavorites = [];
  TextEditingController area = TextEditingController();
  TextEditingController notes = TextEditingController();
  TextEditingController street = TextEditingController();

  int uid = CacheHelper.getData(key: Constants.userID);

  /*Future<void> getFamilies() async {
    emit(state.copyWith(requestState: RequestState.loading));

    final result = await getFamiliesUseCase(const NoParameters());

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
    });
  }*/
/*
  Future<void> getCategories() async {
    emit(state.copyWith(requestState: RequestState.loading));

    final result = await getCategoriesUseCase(GetCategoriesParameters(familyId:));

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
      getCountries();
      getGovernments();
      getRegions();
    });
  }*/

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
    });
  }

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
    });
  }

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
      getTimeSheet();
    });
  }

  List<TimeSheet> timeSheet = [];

  Future<void> getTimeSheet() async {
    emit(state.copyWith(requestState: RequestState.loading));

    final result = await getTimeSheetUseCase(const NoParameters());

    result.fold((l) {
      emit(state.copyWith(
        requestState: RequestState.error,
        responseMessage: l.errMessage,
      ));
    }, (r) {
      emit(state.copyWith(
        timeSheetResponse: r,
        requestState: RequestState.loaded,
      ));

      timeSheet = r;
    });
  }

  Future<void> setAppointment() async {
    emit(state.copyWith(requestState: RequestState.loading));

    //print(timeSheetValue);
    final result = await setAppointmentUseCase(AppointmentParameters(
      categoryId: state.categoryValue,
      area: area.text,
      userId: uid,
      countryId: state.countryValue,
      governmentId: state.governmentValue,
      regionId: state.regionValue,
      street: street.text,
      notes: notes.text,
      imagesId: selectedFavorites,
      timeSheetId: state.timeSheetValue,
    ));

    result.fold((l) {
      emit(state.copyWith(
        requestState: RequestState.error,
        responseMessage: l.errMessage,
      ));
      Fluttertoast.showToast(
        msg: l.errMessage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        fontSize: 14.sp,
      );
    }, (r) {
      emit(state.copyWith(
        appointmentResponse: r,
        requestState: RequestState.loaded,
      ));
      Fluttertoast.showToast(
        msg: r.first.message!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        fontSize: 14.sp,
      );
    });
  }

  void updateCategoryValue(int value) {
    emit(state.copyWith(categoryValue: value));
  }

  void updateCountryValue(int value) {
    emit(state.copyWith(countryValue: value));
  }

  void updateGovernmentValue(int value) {
    emit(state.copyWith(governmentValue: value));
  }

  void updateRegionValue(int value) {
    emit(state.copyWith(regionValue: value));
  }

  void updateTimeSheetValue(int value) {
    emit(state.copyWith(timeSheetValue: value));
  }

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

  List<Step> getSteps() =>
      [
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
