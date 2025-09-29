import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/features/user/session%20details/bloc/cubit/session_details_cubit.dart';

class RowTreatmentPlanWidget extends StatelessWidget {
  const RowTreatmentPlanWidget({
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
        borderRadius: BorderRadius.circular(12.r),
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
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: CachedNetworkImage(
              imageUrl:
                  cubit.treatmentPlansResponse?.data?.therapist?.image ?? '',
              width: 55.w,
              height: 55.h,
              errorWidget: (context, url, error) =>
                  Image.asset("assets/images/png/profile2.png"),
            ),
            // CacheNetworkImagesWidget(
            //   image: cubit.treatmentPlansResponse?.data?.therapist?.image ?? '',
            //   width: 55.w,
            //   height: 55.h,
            // ),
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              spacing: 4.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cubit.treatmentPlansResponse?.data?.therapist?.name ?? '',
                  style: Styles.contentBold.copyWith(
                    color: AppColors.neutralColor1000,
                  ),
                ),
                Text(
                  cubit.treatmentPlansResponse?.data?.therapist
                          ?.specialization ??
                      '',
                  style: Styles.footnoteEmphasis.copyWith(
                    color: AppColors.neutralColor600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
