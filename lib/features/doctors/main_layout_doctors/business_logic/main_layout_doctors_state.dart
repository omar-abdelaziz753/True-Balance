part of 'main_layout_doctors_cubit.dart';


sealed class MainLayoutDoctorsState {}

final class MainLayoutInitial extends MainLayoutDoctorsState {}

final class BottomNavDoctorsState extends MainLayoutDoctorsState {
  final int currentIndex;

  BottomNavDoctorsState(this.currentIndex);
}