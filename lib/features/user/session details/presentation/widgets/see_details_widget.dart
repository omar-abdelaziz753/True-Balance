import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/features/user/session%20details/bloc/cubit/session_details_cubit.dart';

class SeeDetailsWidget extends StatelessWidget {
  final int index;

  const SeeDetailsWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SessionDetailsCubit>(); 

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10.sp),
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
      child: Row(
        spacing: 10.sp,
        children: [
          Expanded(
            child: Text(
              'Session ${(cubit.completedSessions[index].index ?? 0) + 1}',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: Styles.captionEmphasis.copyWith(
                color: AppColors.neutralColor1000,
              ),
            ),
          ),
          Text(
            "See Details",
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
    );
  }
}
