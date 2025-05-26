import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/hex_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';

class CustomCountOfNoOfNotificationsWidget extends StatelessWidget {
  const CustomCountOfNoOfNotificationsWidget({
    super.key,
    required this.counter,
  });

  final String counter;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -8.h,
      right: -5.w,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 6.w,
          vertical: 2.h,
        ),
        decoration: BoxDecoration(
          color: hexToColor('#F55157'),
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 1.w,
          ),
        ),
        child: Text(
          counter, // number of notifications
          style: Styles.footnoteRegular.copyWith(
              color: AppColors.neutralColor100,
              fontSize: 10.sp
          ),
        ),
      ),
    );
  }
}
