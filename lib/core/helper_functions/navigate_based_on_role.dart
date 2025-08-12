
import 'package:truee_balance_app/core/cache_helper/cache_helper.dart';
import 'package:truee_balance_app/core/cache_helper/cache_keys.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';

void navigateBasedOnRole() {
  if (AppConstants.userToken == null) {
    if (CacheHelper.getData(key: CacheKeys.isFirstOpen) == true) {
      AppConstants.navigatorKey.currentContext
          ?.pushNamedAndRemoveUntil(Routes.loginScreen);
    } else {
      AppConstants.navigatorKey.currentContext
          ?.pushNamedAndRemoveUntil(Routes.onBoardingScreen);
    }
  } else {
    final type = CacheHelper.getData(key: CacheKeys.type);
    switch (type) {
      case 'user':
        AppConstants.navigatorKey.currentContext
            ?.pushNamedAndRemoveUntil(Routes.mainLayoutScreen);
        break;
      case 'doctor':
        AppConstants.navigatorKey.currentContext
            ?.pushNamedAndRemoveUntil(Routes.mainLayoutTherapistsScreen);
  
        break;
      default:
    }
  }
}