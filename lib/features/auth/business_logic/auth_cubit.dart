import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truee_balance_app/core/helper_functions/navigate_based_on_role.dart';
import 'package:truee_balance_app/core/utils/easy_loading.dart';
import 'package:truee_balance_app/features/auth/data/repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepository) : super(AuthInitial());

  final AuthRepository authRepository;

  // Form key
  final formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController =
      TextEditingController(text: "mohamedmarei21135@gmail.com");
  final TextEditingController passwordController =
      TextEditingController(text: "12345678");
  final TextEditingController rePasswordController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController verificationCodeController =
      TextEditingController();

  // Password visibility toggles
  bool isObscure = true;
  bool isObscure2 = true;

  void toggleObscure() {
    isObscure = !isObscure;
    emit(TogglePasswordState());
  }

  void toggleObscure2() {
    isObscure2 = !isObscure2;
    emit(TogglePasswordState2());
  }

  /// Login
  Future<void> userLogin() async {
    showLoading();
    emit(LoginLoadingState());
    final result = await authRepository.userLogin(
      email: emailController.text,
      password: passwordController.text,
    );
    result.when(success: (data) {
      hideLoading();
      navigateBasedOnRole();
      emit(LoginSuccessState());
    }, failure: (error) {
      hideLoading();
      emit(LoginFailureState());
    });
  }

  /// Register
  Future<void> userRegister() async {
    showLoading();
    emit(RegisterLoadingState());

    final result = await authRepository.userRegister(
      name: nameController.text,
      phone: phoneController.text,
      email: emailController.text,
      password: passwordController.text,
      rePassword: passwordController.text,
      verificationCode: verificationCodeController.text.isEmpty
          ? null
          : verificationCodeController.text,
      location: "aaaaa",
    );

    result.when(
      success: (data) {
        hideLoading();
        if (verificationCodeController.text.isNotEmpty) {
          emit(OtpSuccessState());
        } else {
          emit(RegisterSuccessState());
        }
      },
      failure: (error) {
        hideLoading();
        emit(RegisterFailureState());
      },
    );
  }

  /// forgetpassword
  Future<void> forgetPassword() async {
    showLoading();
    emit(ForgetPasswordLoadingState());
    final result = await authRepository.forgetPassword(
      email: emailController.text,
    );
    result.when(success: (data) {
      hideLoading();
      emit(ForgetPasswordSuccessState());
    }, failure: (error) {
      hideLoading();
      emit(ForgetPasswordFailureState());
    });
  }

  /// verfiy code
  Future<void> verfiyCode() async {
    showLoading();
    emit(VerfiyCodeLoadingState());
    final result = await authRepository.verfiyCode(
      password: passwordController.text,
      verificationCode: verificationCodeController.text,
      passwordConfirm: rePasswordController.text,
    );
    result.when(success: (data) {
      hideLoading();
      emit(VerfiyCodeSuccessState());
    }, failure: (error) {
      hideLoading();
      emit(VerfiyCodeFailureState());
    });
  }

  /// logout
  Future logout() async {
    showLoading();
    emit(LogoutLoading());
    final result = await authRepository.logout();
    result.when(success: (success) {
      hideLoading();
      emit(LogoutSuccess());
    }, failure: (error) {
      hideLoading();
      emit(LogoutError());
    });
  }
}
