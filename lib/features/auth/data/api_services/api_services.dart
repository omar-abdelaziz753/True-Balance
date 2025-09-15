import 'package:dio/dio.dart';
import 'package:truee_balance_app/core/cache_helper/cache_helper.dart';
import 'package:truee_balance_app/core/cache_helper/cache_keys.dart';
import 'package:truee_balance_app/core/networks_helper/dio_helper/dio_helper.dart';
import 'package:truee_balance_app/core/networks_helper/dio_helper/end_points.dart';

class AuthApiServices {
  AuthApiServices(this._dioFactory);

  final DioHelper _dioFactory;

  /// Login
  Future<Response?> login({
    required String email,
    required String password,
  }) async {
    return _dioFactory.post(endPoint: EndPoints.login, data: {
      'email': email,
      'password': password,
      'fcm_token': CacheHelper.getData(key: CacheKeys.deviceToken),
    });
  }

  /// Register
  Future<Response?> register({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String rePassword,
    String? verificationCode,
  }) async {
    Map<String, dynamic> formDataMap = {
      "name": name,
      "phone": phone,
      "email": email,
      "password": password,
      "repassword": rePassword,
      "verification_code": verificationCode,
    };

    formDataMap
        .removeWhere((key, value) => value == null || value.toString().isEmpty);

    return _dioFactory.post(
      endPoint: EndPoints.register,
      data: formDataMap,
    );
  }

  /// forgetpassword
  Future<Response?> forgetPassword({
    required String email,
  }) {
    return _dioFactory.post(
      endPoint: EndPoints.forgetPassword,
      data: {
        'email': email,
      },
    );
  }

  /// verfiy code
  Future<Response?> verfiyCode({
    required String password,
    required String verificationCode,
    required String passwordConfirm,
  }) {
    return _dioFactory.post(
      endPoint: EndPoints.verfiyCode,
      data: {
        'code': verificationCode,
        'password': password,
        'password_confirmation': passwordConfirm
      },
    );
  }

  Future<Response?> verifyOTP({required String otp}) {
    return _dioFactory.post(
      endPoint: EndPoints.verifyOTP,
      data: {
        'code': otp,
      },
    );
  }

  /// Create a New Password
  Future<Response?> createNewPassword({
    required String newPassword,
    required String newPasswordConfirmation,
  }) {
    return _dioFactory.post(
      endPoint: EndPoints.createNewPassword,
      data: {
        'new_password': newPassword,
        'new_password_confirmation': newPasswordConfirmation,
        'type': CacheHelper.getData(key: CacheKeys.typeInOTP),
      },
    );
  }

  /// logout
  Future<Response?> logout() async {
    return _dioFactory.post(endPoint: EndPoints.logout);
  }
}
