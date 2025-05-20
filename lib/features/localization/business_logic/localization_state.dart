part of 'localization_cubit.dart';

sealed class LocalizationState  {


}

final class LocalizationInitial extends LocalizationState {}

final class LocalizationLoading extends LocalizationState {}

final class LocalizationChange extends LocalizationState {}
