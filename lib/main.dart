import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/cache_helper/cache_helper.dart';
import 'package:truee_balance_app/core/cache_helper/cache_keys.dart';
import 'package:truee_balance_app/core/networks_helper/dio_helper/dio_helper.dart';
import 'package:truee_balance_app/core/routing/app_router.dart';
import 'package:truee_balance_app/core/services/di/dependency_injection.dart';
import 'package:truee_balance_app/core/services/firebase/fcm.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';
import 'package:truee_balance_app/firebase_options.dart';
import 'package:truee_balance_app/true_balance.dart';

import 'core/utils/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setupDependencyInjection();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  await DioHelper.init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();

  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  await PushNotificationService().initialize();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();
//  await CacheHelper.clearAllData();
// await  CacheHelper.clearAllSecuredData();
  AppConstants.userToken =
      await CacheHelper.getSecuredString(key: CacheKeys.userToken);
  // logSuccess("User Token: ${AppConstants.userToken}");
  // logSuccess("fcmToken: ${CacheHelper.getData(key: CacheKeys.deviceToken)}");

  runApp(
    EasyLocalization(
      saveLocale: true,
      useFallbackTranslations: true,
      fallbackLocale: const Locale('en', 'UK'),
      supportedLocales: const [
        Locale('ar', 'EG'),
        Locale('en', 'UK'),
      ],
      path: 'assets/languages',
      child: Phoenix(
        child: TrueBalanceApp(
          appRouter: AppRouter(),
          token: AppConstants.userToken,
        ),
      ),
    ),
  );
}
