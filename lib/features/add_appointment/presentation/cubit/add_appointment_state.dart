part of 'add_appointment_cubit.dart';

class AddAppointmentState extends Equatable {
  final int? currentStep;

  final List<Categories>? categoriesResponse;
  final List<Countries>? countriesResponse;
  final List<Governments>? governmentsResponse;
  final List<Regions>? regionsResponse;
  final List<TimeSheet>? timeSheetResponse;
  final List<ApiResponse>? appointmentResponse;

  final RequestState requestState;
  final String responseMessage;

  const AddAppointmentState({
    this.categoriesResponse,
    this.countriesResponse,
    this.governmentsResponse,
    this.regionsResponse,
    this.timeSheetResponse,
    this.appointmentResponse,
    this.currentStep,
    this.requestState = RequestState.loading,
    this.responseMessage = '',
  });

  AddAppointmentState copyWith({
    int? currentStep,
    List<Categories>? categoriesResponse,
    List<Countries>? countriesResponse,
    List<Governments>? governmentsResponse,
    List<Regions>? regionsResponse,
    List<TimeSheet>? timeSheetResponse,
    List<ApiResponse>? appointmentResponse,
    RequestState? requestState,
    String? responseMessage,
  }) {
    return AddAppointmentState(
      currentStep: currentStep ?? this.currentStep,
      categoriesResponse: categoriesResponse ?? this.categoriesResponse,
      countriesResponse: countriesResponse ?? this.countriesResponse,
      governmentsResponse: governmentsResponse ?? this.governmentsResponse,
      regionsResponse: regionsResponse ?? this.regionsResponse,
      timeSheetResponse: timeSheetResponse ?? this.timeSheetResponse,
      appointmentResponse: appointmentResponse ?? this.appointmentResponse,
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
        currentStep,
        requestState,
        responseMessage
      ];
}
