import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';

class ShowMoreSkeletonizerWidget extends StatelessWidget {
  const ShowMoreSkeletonizerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: false,
      child: Text(
        "عرض المزيد",
        style: Styles.captionEmphasis.copyWith(
          color: AppColors.neutralColor300,
        ),
      ),
    );
  }
}
