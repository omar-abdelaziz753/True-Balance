import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';

class CustomSectionInAboutUsWidget extends StatelessWidget {
  const CustomSectionInAboutUsWidget({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Text(
        description,
        style: Styles.captionRegular.copyWith(
          color: AppColors.neutralColor1000,
        ),
      ),
    );
  }
}
