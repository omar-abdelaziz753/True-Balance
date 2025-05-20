import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  final String imagePath;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.sp),
      child: Center(
        child: Column(
          children: [
            SvgPicture.asset(
              imagePath,
              fit: BoxFit.scaleDown,
            ),
            24.verticalSpace,
            Text(
              title,
              textAlign: TextAlign.center,
              style: Styles.heading3
            ),
            12.verticalSpace,
            Text(
              description,
              textAlign: TextAlign.center,
              style: Styles.featureStandard.copyWith(
                color: AppColors.neutralColor600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
