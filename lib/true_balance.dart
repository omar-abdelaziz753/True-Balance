import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/routing/app_router.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';

class TrueBalanceApp extends StatelessWidget {
  const TrueBalanceApp({
    super.key,
    required this.appRouter,
    this.token,
  });

  final AppRouter appRouter;
  final String? token;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ),
        child: Builder(
          builder: (context) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'True Balance',
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            navigatorKey: AppConstants.navigatorKey,
            initialRoute: Routes.splashScreen,
            onGenerateRoute: appRouter.generateRoute,
            // home: const TestScreen(),
            builder: EasyLoading.init(),
          ),
        ),
      ),
    );
  }
}
