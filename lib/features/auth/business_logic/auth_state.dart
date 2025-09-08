part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginLoadingState extends AuthState {}

final class LoginSuccessState extends AuthState {}

final class LoginFailureState extends AuthState {}

final class TogglePasswordState extends AuthState {}

final class TogglePasswordState2 extends AuthState {}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {}

class RegisterFailureState extends AuthState {}

class ForgetPasswordLoadingState extends AuthState {}

class ForgetPasswordSuccessState extends AuthState {}

class ForgetPasswordFailureState extends AuthState {}

class VerfiyCodeLoadingState extends AuthState {}

class VerfiyCodeSuccessState extends AuthState {}

class VerfiyCodeFailureState extends AuthState {}

/// Create A New Password States
final class CreateNewPasswordLoadingState extends AuthState {}

final class CreateNewPasswordSuccessState extends AuthState {}

final class CreateNewPasswordFailureState extends AuthState {}

/// Verify OTP States
final class VerifyOtpLoadingState extends AuthState {}

final class VerifyOtpSuccessState extends AuthState {}

final class VerifyOtpFailureState extends AuthState {}

class CreateNewPasswordState extends AuthState {}

class LogoutLoading extends AuthState {}

class LogoutSuccess extends AuthState {}

class LogoutError extends AuthState {}

class OtpSuccessState extends AuthState {}
class Otp2SuccessState extends AuthState {}
class ResendPasswordLoadingState extends AuthState {}
