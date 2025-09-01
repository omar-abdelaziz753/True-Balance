
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/features/user/session%20details/bloc/cubit/session_details_cubit.dart';

class TotalOfTreatmentwidget extends StatelessWidget {
  const TotalOfTreatmentwidget({
    super.key,
    required this.cubit,
  });

  final SessionDetailsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(
        color: AppColors.neutralColor100,
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(
          color: AppColors.neutralColor1000.withAlpha(20),
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
      child: Row(
        children: [
          Text(
            'totalOftreatment'.tr(),
            style: Styles.captionEmphasis.copyWith(
              color: AppColors.neutralColor600,
            ),
          ),
          const Spacer(),
          Text(
            "${cubit.treatmentPlansResponse?.data?.treatmentPlans!.length ?? "0"}",
            style: Styles.contentEmphasis.copyWith(
              color: AppColors.neutralColor1000,
            ),
          ),
        ],
      ),
    );
  }
}
