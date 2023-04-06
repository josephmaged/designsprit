part of 'add_appointment_cubit.dart';

class AddAppointmentState extends Equatable {
  final int? currentStep;

  final List<Families> familiesResponse;
  late final List<Categories> categoriesResponse;
  final List<Countries> countriesResponse;
  final List<Governments> governmentsResponse;
  final List<Regions> regionsResponse;
  final List<TimeSheet> timeSheetResponse;
  final List<ApiResponse> appointmentResponse;

  final int? familiesValue;
  final int? categoryValue;
  final int? countryValue;
  final int? governmentValue;
  final int? regionValue;
  final int? timeSheetValue;

  final RequestState familyState;
  final String familyMessage;
  final RequestState categoryState;
  final String categoryMessage;
  final RequestState governmentState;
  final String governmentMessage;
  final RequestState countryState;
  final String countryMessage;
  final RequestState regionState;
  final String regionMessage;
  final RequestState timesheetState;
  final String timesheetMessage;
  final RequestState appointmentState;
  final String appointmentMessage;

  AddAppointmentState({
    this.currentStep,
    this.familiesResponse = const [],
    this.categoriesResponse = const [],
    this.countriesResponse = const [],
    this.governmentsResponse = const [],
    this.regionsResponse = const [],
    this.timeSheetResponse = const [],
    this.appointmentResponse = const [],
    this.familiesValue,
    this.categoryValue,
    this.countryValue,
    this.governmentValue,
    this.regionValue,
    this.timeSheetValue,
    this.familyState = RequestState.loading,
    this.familyMessage = '',
    this.categoryState = RequestState.loading,
    this.categoryMessage = '',
    this.governmentState = RequestState.loading,
    this.governmentMessage = '',
    this.countryState = RequestState.loading,
    this.countryMessage = '',
    this.regionState = RequestState.loading,
    this.regionMessage = '',
    this.timesheetState = RequestState.loading,
    this.timesheetMessage = '',
    this.appointmentState = RequestState.loading,
    this.appointmentMessage = '',
  });

  AddAppointmentState copyWith({
    int? currentStep,
    List<Families>? familiesResponse,
    List<Categories>? categoriesResponse,
    List<Countries>? countriesResponse,
    List<Governments>? governmentsResponse,
    List<Regions>? regionsResponse,
    List<TimeSheet>? timeSheetResponse,
    List<ApiResponse>? appointmentResponse,
    int? familiesValue,
    int? categoryValue,
    int? countryValue,
    int? governmentValue,
    int? regionValue,
    int? timeSheetValue,
    RequestState? familyState,
    String? familyMessage,
    RequestState? categoryState,
    String? categoryMessage,
    RequestState? governmentState,
    String? governmentMessage,
    RequestState? countryState,
    String? countryMessage,
    RequestState? regionState,
    String? regionMessage,
    RequestState? timesheetState,
    String? timesheetMessage,
    RequestState? appointmentState,
    String? appointmentMessage,
  }) {
    return AddAppointmentState(
      currentStep: currentStep ?? this.currentStep,
      familiesResponse: familiesResponse ?? this.familiesResponse,
      categoriesResponse: categoriesResponse ?? this.categoriesResponse,
      countriesResponse: countriesResponse ?? this.countriesResponse,
      governmentsResponse: governmentsResponse ?? this.governmentsResponse,
      regionsResponse: regionsResponse ?? this.regionsResponse,
      timeSheetResponse: timeSheetResponse ?? this.timeSheetResponse,
      appointmentResponse: appointmentResponse ?? this.appointmentResponse,
      familiesValue: familiesValue ?? this.familiesValue,
      categoryValue: categoryValue ?? this.categoryValue,
      countryValue: countryValue ?? this.countryValue,
      governmentValue: governmentValue ?? this.governmentValue,
      regionValue: regionValue ?? this.regionValue,
      timeSheetValue: timeSheetValue ?? this.timeSheetValue,
      familyState: familyState ?? this.familyState,
      familyMessage: familyMessage ?? this.familyMessage,
      categoryState: categoryState ?? this.categoryState,
      categoryMessage: categoryMessage ?? this.categoryMessage,
      governmentState: governmentState ?? this.governmentState,
      governmentMessage: governmentMessage ?? this.governmentMessage,
      countryState: countryState ?? this.countryState,
      countryMessage: countryMessage ?? this.countryMessage,
      regionState: regionState ?? this.regionState,
      regionMessage: regionMessage ?? this.regionMessage,
      timesheetState: timesheetState ?? this.timesheetState,
      timesheetMessage: timesheetMessage ?? this.timesheetMessage,
      appointmentState: appointmentState ?? this.appointmentState,
      appointmentMessage: appointmentMessage ?? this.appointmentMessage,
    );
  }

  @override
  List<Object?> get props => [
        currentStep,
        categoriesResponse,
        countriesResponse,
        governmentsResponse,
        regionsResponse,
        timeSheetResponse,
        appointmentResponse,
        familiesValue,
        categoryValue,
        countryValue,
        governmentValue,
        regionValue,
        timeSheetValue,
        currentStep,
        familyState,
        familyMessage,
        categoryState,
        categoryMessage,
        governmentState,
        governmentMessage,
        countryState,
        countryMessage,
        regionState,
        regionMessage,
        timesheetState,
        timesheetMessage,
        appointmentState,
        appointmentMessage,
      ];
}
