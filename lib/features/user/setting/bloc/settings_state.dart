part of 'settings_cubit.dart';

@immutable
sealed class SettingsState {}

final class SettingsInitial extends SettingsState {}

/// Get Profile Data State
class GetProfileDataLoadingState extends SettingsState {}

class GetProfileDataSuccessState extends SettingsState {}

class GetProfileDataErrorState extends SettingsState {
  final String errorMessage;

  GetProfileDataErrorState({required this.errorMessage});
}

/// Update Profile Data State
class UpdateProfileDataLoadingState extends SettingsState {}

class UpdateProfileDataSuccessState extends SettingsState {}

class UpdateProfileDataErrorState extends SettingsState {
  final String errorMessage;

  UpdateProfileDataErrorState({required this.errorMessage});
}

/// Profile Image Selected State
final class ProfileImageSelectedState extends SettingsState {}

final class ProfileImageErrorState extends SettingsState {}


