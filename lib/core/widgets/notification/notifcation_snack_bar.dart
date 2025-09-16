// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:top_snackbar_flutter/custom_snack_bar.dart';
// import 'package:top_snackbar_flutter/top_snack_bar.dart';
// import 'package:truee_balance_app/core/themes/app_colors.dart';
//
// notificationSnackBar({
//   required context,
//   required message,
//   required RemoteMessage event,
// }) {
//   showTopSnackBar(
//     Overlay.of(context),
//     CustomSnackBar.success(
//       message: "$message\n ${event.data["body"] ?? ""}",
//       backgroundColor: AppColors.primaryColor800,
//       messagePadding: EdgeInsets.only(left: 5.w),
//       icon: Padding(
//           padding: EdgeInsetsDirectional.symmetric(horizontal: 5.w),
//           child: const Icon(Icons.notifications)),
//     ),
//     dismissDirection: [
//       DismissDirection.vertical,
//       DismissDirection.horizontal,
//     ],
//     curve: Curves.fastLinearToSlowEaseIn,
//     displayDuration: const Duration(seconds: 3),
//     dismissType: DismissType.onTap,
//   );
// }


import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';

/// Shows a beautiful, customizable notification snackbar.
void notificationSnackBar({
  required BuildContext context,
  required String message,
  required RemoteMessage event,
  bool persistent = false,
  void Function(AnimationController controller)? onAnimationControllerInit,
}) {
  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.success(
      message: "$message\n${event.data["body"] ?? ""}",

      // 🔹 Theme-based background color
      backgroundColor: AppColors.neutralColor200,

      // 🔹 Modern text style
      textStyle: Styles.contentBold.copyWith(color: AppColors.primaryColor800),

      // 🔹 Rounded shape & shadow like example
      borderRadius: BorderRadius.circular(16.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10,
          offset: const Offset(0, 3),
        ),
      ],

      // 🔹 Better spacing for message
      messagePadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),

      // 🔹 Better icon
      icon: Padding(
        padding: EdgeInsetsDirectional.only(end: 18.w, start: 18.w),
        child: Icon(
          Icons.notifications,
          color: AppColors.primaryColor900,
          size: 20.sp,
        ),
      ),
    ),
    dismissDirection: [
      DismissDirection.vertical,
      DismissDirection.horizontal,
    ],
    curve: Curves.easeOutBack, // smoother animation
    displayDuration: const Duration(seconds: 3),
    dismissType: DismissType.onTap,
    persistent: persistent,
    onAnimationControllerInit: onAnimationControllerInit,
  );
}
