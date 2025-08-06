part of 'main_layout_therapists_cubit.dart';


sealed class MainLayoutTherapistsState {}

final class MainLayoutInitial extends MainLayoutTherapistsState {}

final class BottomNavTherapistsState extends MainLayoutTherapistsState {
  final int currentIndex;

  BottomNavTherapistsState(this.currentIndex);
}