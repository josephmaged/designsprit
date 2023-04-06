part of 'add_appointment_cubit.dart';

class AddAppointmentState extends Equatable {
  final int? currentStep;

  final List<Families> familiesResponse;
  final List<Categories> categoriesResponse;
  final List<Countries> countriesResponse;
  final List<Governments> governmentsResponse;
  final List<Regions> regionsResponse;
  List<TimeSheet> timeSheetResponse;
  final List<ApiResponse> appointmentResponse;

  int categoryValue;
  int countryValue;
  int governmentValue;
  int regionValue;
  int timeSheetValue;

  final RequestState requestState;
  final String responseMessage;

  AddAppointmentState({
    this.familiesResponse = const [],
    this.categoriesResponse = const [],
    this.countriesResponse = const [],
    this.governmentsResponse = const [],
    this.regionsResponse = const [],
    this.timeSheetResponse = const [],
    this.appointmentResponse = const [],
    required this.categoryValue,
    required this.countryValue,
    required this.governmentValue,
    required this.regionValue,
    required this.timeSheetValue,
    this.currentStep,
    this.requestState = RequestState.loading,
    this.responseMessage = '',
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
    int? categoryValue,
    int? countryValue,
    int? governmentValue,
    int? regionValue,
    int? timeSheetValue,
    RequestState? requestState,
    String? responseMessage,
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
      categoryValue: categoryValue ?? this.categoryValue,
      countryValue: countryValue ?? this.countryValue,
      governmentValue: governmentValue ?? this.governmentValue,
      regionValue: regionValue ?? this.regionValue,
      timeSheetValue: timeSheetValue ?? this.timeSheetValue,
      requestState: requestState ?? this.requestState,
      responseMessage: responseMessage ?? this.responseMessage,
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
        categoryValue,
        countryValue,
        governmentValue,
        regionValue,
        timeSheetValue,
        currentStep,
        requestState,
        responseMessage
      ];
}
