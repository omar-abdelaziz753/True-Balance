import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:true_balance_app/core/cache_helper/cache_helper.dart';
import 'package:true_balance_app/core/cache_helper/cache_keys.dart';
import 'package:true_balance_app/core/networks_helper/dio_helper/dio_helper.dart';
import 'package:true_balance_app/core/routing/app_router.dart';
import 'package:true_balance_app/core/services/di/dependency_injection.dart';
import 'package:true_balance_app/core/services/firebase/fcm.dart';
import 'package:true_balance_app/core/utils/app_constants.dart';
import 'package:true_balance_app/firebase_options.dart';
import 'package:true_balance_app/true_balance.dart';

import 'core/utils/bloc_observer.dart';

void main() {
  unawaited(
    runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        try {
          await _initAndRun();
        } catch (error, stack) {
          _recordInitError(error, stack);
          runApp(const _StartupErrorApp());
        }
      },
      (error, stack) {
        _recordInitError(error, stack);
      },
    ),
  );
}

/// Records startup/zone errors via Crashlytics when Firebase is already up.
/// Before Firebase initializes there is nothing to record to, so init
/// failures fall back to the on-screen startup error instead.
void _recordInitError(Object error, StackTrace stack) {
  try {
    if (Firebase.apps.isNotEmpty) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    }
  } catch (_) {
    // Crashlytics unavailable — the error is surfaced via _StartupErrorApp.
  }
}

Future<void> _initAndRun() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setupDependencyInjection();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

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
  // Get system locale
  final systemLocale = PlatformDispatcher.instance.locale.languageCode;

  // Check if we already saved a language before
  final savedLocale =
      CacheHelper.getData(key: CacheKeys.currentLanguage) as String?;

  // If not saved, use system locale or fallback to 'en'
  if (savedLocale == null) {
    await CacheHelper.saveData(
      key: CacheKeys.currentLanguage,
      value: systemLocale,
    );
    if (kDebugMode) {
      log("Locale saved in cache: $systemLocale");
    }
  } else {
    if (kDebugMode) {
      log("Loaded locale from cache: $savedLocale");
    }
  }
  AppConstants.userToken =
      await CacheHelper.getSecuredString(key: CacheKeys.userToken);

  runApp(
    EasyLocalization(
      saveLocale: true,
      useFallbackTranslations: true,
      fallbackLocale: const Locale('ar', 'EG'),
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

/// Minimal fallback shown only when startup itself fails. Contains no
/// tokens, keys, or other sensitive data.
class _StartupErrorApp extends StatelessWidget {
  const _StartupErrorApp();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text('Something went wrong. Please restart the app.'),
        ),
      ),
    );
  }
}
