import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';

class AppBarBackButtonWidget extends StatelessWidget {
  const AppBarBackButtonWidget({super.key, this.onTap});
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
              () {
            context.pop();
          },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.w),
        // padding: EdgeInsets.symmetric(horizontal: 10.w),
        // padding: EdgeInsets.symmetric(horizontal: 12.w),
        // child: Transform.rotate(
          // angle: isArabic ? 0 : 3.1416, // 180 degrees for English
          // child: SvgPicture.asset(
          //   'assets/images/svgs/back_icon.svg',
          //   width: 34.w,
          //   height: 34.h,
          // ),
          child: BackButton(),
        // ),
      ),
    );
  }
}