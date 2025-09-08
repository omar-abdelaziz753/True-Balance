import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/features/user/create%20booking/data/model/treatment_plans_response.dart';

class TreatmenPlanItemWidget extends StatelessWidget {
  const TreatmenPlanItemWidget({
    super.key,
    required this.planItem,
  });

  final TreatmentPlan planItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(
        color: AppColors.neutralColor100,
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(
          color: AppColors.primaryColor900,
          width: 1.w,
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2.h),
            blurRadius: 8.r,
            spreadRadius: 0,
            color: Colors.black.withAlpha(20),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          context.pushNamed(
            Routes.treatmentdetailsScreen,
            arguments: planItem.id ?? 0,
          );
        },
        child: Row(
          spacing: 10.sp,
          children: [
            Expanded(
              child: Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                planItem.name ?? '',
                style: Styles.captionEmphasis.copyWith(
                  color: AppColors.neutralColor1000,
                ),
              ),
            ),
            // const Spacer(),
            Text(
              'seeDetails'.tr(),
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.secondaryColor500,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.secondaryColor500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
