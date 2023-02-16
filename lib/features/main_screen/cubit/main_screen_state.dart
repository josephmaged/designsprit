part of 'main_screen_cubit.dart';

class MainScreenState extends Equatable {
  final int? currentIndex;

  const MainScreenState({
    this.currentIndex,
  });

  MainScreenState copyWith({int? currentIndex}) {
    return MainScreenState(currentIndex: currentIndex ?? this.currentIndex);
  }

  @override
  List<Object?> get props => [
        currentIndex,
      ];
}
