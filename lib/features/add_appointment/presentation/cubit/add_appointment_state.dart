part of 'add_appointment_cubit.dart';

class AddAppointmentState extends Equatable {
  final int? currentStep;

  const AddAppointmentState({
    this.currentStep,
  });

  AddAppointmentState copyWith({
    int? currentStep,
  }) {
    return AddAppointmentState(
      currentStep: currentStep ?? this.currentStep,
    );
  }

  @override
  List<Object?> get props => [
        currentStep,
      ];
}
