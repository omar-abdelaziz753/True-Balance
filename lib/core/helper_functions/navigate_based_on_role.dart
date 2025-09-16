import 'package:truee_balance_app/core/cache_helper/cache_helper.dart';
import 'package:truee_balance_app/core/cache_helper/cache_keys.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';

void navigateBasedOnRole() {
  final rawType = CacheHelper.getData(key: CacheKeys.type);
  final type = (rawType ?? '').toString().trim().toLowerCase();
  AppConstants.userMainLayoutInitialScreenIndex = 0;
  if (AppConstants.userToken == null) {
    final isFirstOpen =
        CacheHelper.getData(key: CacheKeys.isFirstOpen) ?? false;
    if (isFirstOpen) {
      AppConstants.navigatorKey.currentContext
          ?.pushNamedAndRemoveUntil(Routes.loginScreen);
    } else {
      AppConstants.navigatorKey.currentContext
          ?.pushNamedAndRemoveUntil(Routes.onBoardingScreen);
    }
  } else {
    switch (type) {
      case 'user':
        AppConstants.navigatorKey.currentContext
            ?.pushNamedAndRemoveUntil(Routes.mainLayoutScreen);
        break;
      case 'doctor':
        AppConstants.navigatorKey.currentContext
            ?.pushNamedAndRemoveUntil(Routes.mainLayoutDoctorsScreen);
      case 'therapist':
        AppConstants.navigatorKey.currentContext
            ?.pushNamedAndRemoveUntil(Routes.mainLayoutDoctorsScreen);
        break;
      default:
        AppConstants.navigatorKey.currentContext
            ?.pushNamedAndRemoveUntil(Routes.loginScreen);
    }
  }
}
