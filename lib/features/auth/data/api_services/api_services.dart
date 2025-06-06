import 'package:dio/dio.dart';
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
    required String location,
  }) async {
    Map<String, dynamic> formDataMap = {
      "name": name,
      "phone": phone,
      "email": email,
      "password": password,
      "repassword": rePassword,
      "verification_code": verificationCode,
      "location": location,
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

  /// logout
  Future<Response?> logout() async {
    return _dioFactory.post(endPoint: EndPoints.logout);
  }
}
