import 'package:get_it/get_it.dart';
import '../../networks_helper/dio_helper/dio_helper.dart';

final getIt = GetIt.instance;

Future<void> setupDependencyInjection() async {
  /// Shared DI
  /// Dio
  getIt.registerLazySingleton<DioHelper>(() => DioHelper());

  /// User DI
  /// ApiServices
  // getIt.registerLazySingleton<UserAuthApiServices>(() => UserAuthApiServices(getIt()));

  /// Repos
  // getIt.registerLazySingleton<UserAuthRepository>(() => UserAuthRepository(getIt()));

  /// ================================================================================= ///

  /// Provider DI
  /// ApiServices
  // getIt.registerLazySingleton<AuthApiServices>(() => AuthApiServices(getIt()));


  /// Repos
  // getIt.registerLazySingleton<AuthRepository>(() => AuthRepository(getIt()));

}
