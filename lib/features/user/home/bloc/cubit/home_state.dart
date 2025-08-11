part of 'home_cubit.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeIndexChanged extends HomeState {}

/// Slider States
class SliderLoading extends HomeState {}

class SliderSuccess extends HomeState {}

class SliderFailure extends HomeState {}

/// Doctors States
class DoctorsLoading extends HomeState {}

class DoctorsSuccess extends HomeState {}

class DoctorsFailure extends HomeState {}

/// Services States
class ServicesLoading extends HomeState {}

class ServicesSuccess extends HomeState {}

class ServicesFailure extends HomeState {}

class ServicesLoadingMore extends HomeState {}
