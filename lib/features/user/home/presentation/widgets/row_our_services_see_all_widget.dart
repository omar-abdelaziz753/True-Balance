import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';

class RowOurservicesSeeallWidget extends StatelessWidget {
  const RowOurservicesSeeallWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'ourServices'.tr(),
          style: Styles.captionAccent.copyWith(
            color: AppColors.neutralColor1000,
          ),
        ),
        InkWell(
          onTap: () {
            context.pushNamed(Routes.ourServicesScreen);
          },
          child: Text(
            'seeAll'.tr(),
            style: Styles.captionAccent.copyWith(
              color: AppColors.secondaryColor500,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.secondaryColor500,
              decorationThickness: 1.5.w,
            ),
          ),
        ),
      ],
    );
  }
}
