import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';

class CustomRowMakeTitleAndDescWidget extends StatelessWidget {
  const CustomRowMakeTitleAndDescWidget({
    super.key, required this.title, required this.description,
  });

  final String title, description;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12.w,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Styles.captionEmphasis.copyWith(
            color: AppColors.neutralColor600,
          ),
        ),
        Expanded(
          child: Text(
            description,
            style: Styles.contentEmphasis.copyWith(
              color: AppColors.neutralColor1000,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
