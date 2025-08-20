import 'package:truee_balance_app/core/cache_helper/cache_helper.dart';
import 'package:truee_balance_app/core/cache_helper/cache_keys.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';

// void navigateBasedOnRole() {
//   if (AppConstants.userToken == null) {
//     if (CacheHelper.getData(key: CacheKeys.isFirstOpen) == true) {
//       AppConstants.navigatorKey.currentContext
//           ?.pushNamedAndRemoveUntil(Routes.loginScreen);
//     } else {
//       AppConstants.navigatorKey.currentContext
//           ?.pushNamedAndRemoveUntil(Routes.onBoardingScreen);
//     }
//   } else {
//     final type = CacheHelper.getData(key: CacheKeys.type);
//     print('type: $type');
//     switch (type) {
//       case 'user':
//         AppConstants.navigatorKey.currentContext
//             ?.pushNamedAndRemoveUntil(Routes.mainLayoutScreen);
//         break;
//       case 'doctor':
//         AppConstants.navigatorKey.currentContext
//             ?.pushNamedAndRemoveUntil(Routes.mainLayoutDoctorsScreen);
//         break;
//       default:
//     }
//   }
// }

void navigateBasedOnRole() {
  // final token = CacheHelper.getData(key: CacheKeys.token); // بدل AppConstants.userToken
  final rawType = CacheHelper.getData(key: CacheKeys.type);
  final type = (rawType ?? '').toString().trim().toLowerCase();

  print('raw type: $rawType');
  print('normalized type: $type');

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
        print("This.doctor");
        AppConstants.navigatorKey.currentContext
            ?.pushNamedAndRemoveUntil(Routes.mainLayoutDoctorsScreen);
        break;
      default:
        AppConstants.navigatorKey.currentContext
            ?.pushNamedAndRemoveUntil(Routes.loginScreen);
    }
  }
}
