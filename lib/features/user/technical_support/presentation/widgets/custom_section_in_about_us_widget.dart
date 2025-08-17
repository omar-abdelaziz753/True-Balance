import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';

class CustomSectionInAboutUsWidget extends StatelessWidget {
  const CustomSectionInAboutUsWidget({
    super.key,
    // required this.number,
    required this.title,
    required this.description,
  });

  final String title, description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Styles.contentEmphasis.copyWith(
              color: AppColors.neutralColor1000,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            description,
            style: Styles.captionRegular.copyWith(
              color: AppColors.neutralColor1000,
            ),
          ),
        ],
      ),
    );
  }
}
