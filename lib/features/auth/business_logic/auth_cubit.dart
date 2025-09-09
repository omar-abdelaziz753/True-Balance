import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truee_balance_app/core/cache_helper/cache_helper.dart';
import 'package:truee_balance_app/core/cache_helper/cache_keys.dart';
import 'package:truee_balance_app/core/helper_functions/navigate_based_on_role.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';
import 'package:truee_balance_app/core/utils/easy_loading.dart';
import 'package:truee_balance_app/features/auth/data/repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepository) : super(AuthInitial());

  final AuthRepository authRepository;

  final formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController verificationCodeController =
      TextEditingController();

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

  Future<void> userRegister({bool isOtp = true, bool isResend = false}) async {
    if (isOtp) showLoading();
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
    );

    result.when(
      success: (data) {
        hideLoading();
        if (verificationCodeController.text.isEmpty) {
          if (isResend) {
            emit(ResendOtpSuccessStateState());
          } else {
            emit(RegisterSuccessState());
          }
        } else {
          emit(Otp2SuccessState());
        }
      },
      failure: (error) {
        hideLoading();
        emit(RegisterFailureState());
      },
    );
  }

  Future<void> forgetPassword({String? email, bool isOtp = true}) async {
    showLoading();
    emit(ForgetPasswordLoadingState());

    final result = await authRepository.forgetPassword(
      email: email ?? emailController.text,
    );
    result.when(success: (data) {
      hideLoading();
      if (isOtp) {
        emit(ForgetPasswordSuccessState());
      } else {
        emit(ResendPasswordLoadingState());
      }
    }, failure: (error) {
      hideLoading();
      emit(ForgetPasswordFailureState());
    });
  }

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

  Future<void> verifyOTP() async {
    showLoading();

    emit(VerfiyCodeLoadingState());
    final result = await authRepository.verifyOTP(
      otp: verificationCodeController.text,
    );
    result.when(success: (data) {
      hideLoading();
      emit(VerfiyCodeSuccessState());
    }, failure: (error) {
      hideLoading();
      emit(VerfiyCodeFailureState());
    });
  }

  Future<void> createNewPassword() async {
    showLoading();
    emit(CreateNewPasswordLoadingState());
    final result = await authRepository.createNewPassword(
      password: passwordController.text,
      passwordConfirm: rePasswordController.text,
    );
    result.when(success: (data) {
      hideLoading();
      emit(CreateNewPasswordSuccessState());
    }, failure: (error) {
      hideLoading();
      emit(CreateNewPasswordFailureState());
    });
  }

  Future logout() async {
    showLoading();
    emit(LogoutLoading());
    final result = await authRepository.logout();
    result.when(success: (success) async {
      hideLoading();
      await CacheHelper.removeData(key: CacheKeys.doctorId);
      await CacheHelper.removeData(key: CacheKeys.doctorName);
      await CacheHelper.clearAllSecuredData();
      await CacheHelper.removeData(key: CacheKeys.type);
      await CacheHelper.removeData(key: CacheKeys.userName);
      await CacheHelper.removeData(key: CacheKeys.userPhone);
      await CacheHelper.removeData(key: CacheKeys.userEmail);
      AppConstants.userToken = null;

      emit(LogoutSuccess());
    }, failure: (error) {
      hideLoading();
      emit(LogoutError());
    });
  }
}
