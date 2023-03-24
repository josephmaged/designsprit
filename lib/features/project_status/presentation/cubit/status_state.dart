part of 'status_cubit.dart';

class StatusState extends Equatable {
  final int? stepIndex;

  const StatusState({this.stepIndex});

  StatusState copyWith({
    int? stepIndex,
  }) {
    return StatusState(
      stepIndex: stepIndex ?? stepIndex,
    );
  }

  List<Object?> get props => [
        stepIndex,
      ];
}
