part of 'main_layout_cubit.dart';


sealed class MainLayoutState {}

final class MainLayoutInitial extends MainLayoutState {}

final class BottomNavState extends MainLayoutState {
  final int currentIndex;

  BottomNavState(this.currentIndex);
}