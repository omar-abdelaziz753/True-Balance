import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';

class RowBestdoctorsSeeallWidget extends StatelessWidget {
  const RowBestdoctorsSeeallWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'bestDoctors'.tr(),
          style: Styles.captionAccent.copyWith(
            color: AppColors.neutralColor1000,
          ),
        ),
        Text(
          'seeAll'.tr(),
          style: Styles.captionAccent.copyWith(
            color: AppColors.secondaryColor500,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.secondaryColor500,
            decorationThickness: 1.5.w,
          ),
        ),
      ],
    );
  }
}
