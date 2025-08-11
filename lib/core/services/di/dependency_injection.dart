import 'package:get_it/get_it.dart';
import 'package:truee_balance_app/features/auth/data/api_services/api_services.dart';
import 'package:truee_balance_app/features/auth/data/repos/auth_repo.dart';
import 'package:truee_balance_app/features/user/create%20booking/data/api%20servies/create_booking_api_services.dart';
import 'package:truee_balance_app/features/user/create%20booking/data/repo/create_booking_repo.dart';
import 'package:truee_balance_app/features/user/doctor%20deatils/data/api%20services/doctor_api_services.dart';
import 'package:truee_balance_app/features/user/doctor%20deatils/data/repo/doctor_repo.dart';
import 'package:truee_balance_app/features/user/home/data/apiServices/home_api_services.dart';
import 'package:truee_balance_app/features/user/home/data/repo/home_repo.dart';
import 'package:truee_balance_app/features/user/session%20details/data/api%20servies/sessions_details_api_services.dart';
import 'package:truee_balance_app/features/user/session%20details/data/repo/sessions_details_repo.dart';
import 'package:truee_balance_app/features/user/sessions/data/api%20servies/sessions_api_services.dart';
import 'package:truee_balance_app/features/user/sessions/data/repo/sessions_repo.dart';

import '../../networks_helper/dio_helper/dio_helper.dart';

final getIt = GetIt.instance;

Future<void> setupDependencyInjection() async {
  /// Shared DI
  /// Dio
  getIt.registerLazySingleton<DioHelper>(() => DioHelper());

  getIt.registerLazySingleton<HomeApiServices>(() => HomeApiServices(getIt()));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));

  getIt.registerLazySingleton<AuthApiServices>(() => AuthApiServices(getIt()));

  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository(getIt()));
  getIt.registerLazySingleton<DoctorApiServices>(
      () => DoctorApiServices(getIt()));

  getIt.registerLazySingleton<DoctorRepo>(() => DoctorRepo(getIt()));
  getIt.registerLazySingleton<CreateBookingApiServices>(
      () => CreateBookingApiServices(getIt()));
  getIt.registerLazySingleton<CreateBookingRepo>(
      () => CreateBookingRepo(getIt()));

  getIt.registerLazySingleton<SessionsApiServices>(
      () => SessionsApiServices(getIt()));
  getIt.registerLazySingleton<SessionsRepo>(() => SessionsRepo(getIt()));

  getIt.registerLazySingleton<SessionsDetailsApiServices>(
      () => SessionsDetailsApiServices(getIt()));
  getIt.registerLazySingleton<SessionsDetailsRepo>(
      () => SessionsDetailsRepo(getIt()));
}
