import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/features/user/session%20details/bloc/cubit/session_details_cubit.dart';

class TotalOfSessionsAndTypeOfTreatment extends StatelessWidget {
  const TotalOfSessionsAndTypeOfTreatment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SessionDetailsCubit>();
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
      child: Column(
        spacing: 12.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Total Of Session",
                style: Styles.captionEmphasis.copyWith(
                  color: AppColors.neutralColor600,
                ),
              ),
              const Spacer(),
              Text(
                cubit.treatmentPlanDetail?.numberOfSessions.toString() ?? "0",
                style: Styles.contentEmphasis.copyWith(
                  color: AppColors.neutralColor1000,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Type of treatment",
                style: Styles.captionEmphasis.copyWith(
                  color: AppColors.neutralColor600,
                ),
              ),
              const Spacer(),
              Text(
                cubit.treatmentPlanDetail?.type ?? "",
                style: Styles.contentEmphasis.copyWith(
                  color: AppColors.neutralColor1000,
                ),
              ),
            ],
          ),
          Text(
            "Notes",
            style: Styles.captionEmphasis.copyWith(
              color: AppColors.neutralColor600,
            ),
          ),
          Text(
            cubit.treatmentPlanDetail?.description ?? "",
            style: Styles.contentEmphasis.copyWith(
              color: AppColors.neutralColor1000,
            ),
          ),
        ],
      ),
    );
  }
}
