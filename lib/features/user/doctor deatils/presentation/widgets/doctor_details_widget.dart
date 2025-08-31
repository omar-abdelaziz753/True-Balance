
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';
import 'package:truee_balance_app/features/user/doctor%20deatils/bloc/cubit/doctor_details_cubit.dart';

class DoctorDetailsWidget extends StatelessWidget {
  const DoctorDetailsWidget({
    super.key,
    required this.cubit,
  });

  final DoctorDetailsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.w,
          color: const Color(0xff0303031).withValues(alpha: 0.1),
        ),
        borderRadius: BorderRadius.circular(
          AppConstants.borderRadius + 4.r,
        ),
        color: const Color(0xffFCFCFC),
        image: DecorationImage(
          image: const AssetImage(
            "assets/images/png/back_ground_best_therapists.png",
          ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            const Color(0xffFCFCFC).withValues(alpha: 0.1),
            BlendMode.dstATop,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 90.w,
            alignment: Alignment.center,
            child: ClipOval(
              child: CachedNetworkImage(
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error),
                imageUrl: cubit.doctorDetails?.data?.image ?? '',
                width: 95.w,
                height: 91.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            cubit.doctorDetails?.data?.name ?? '',
            style: Styles.contentBold.copyWith(
              color: AppColors.neutralColor1000,
            ),
          ),
          12.horizontalSpace,
          Text(
            cubit.doctorDetails?.data?.specialization ?? '',
            style: Styles.footnoteEmphasis.copyWith(
              color: AppColors.neutralColor600,
            ),
          ),
          12.horizontalSpace,
          Text(
            "${'age'.tr()} : ${cubit.doctorDetails?.data?.age?.toString() ?? ''}",
            style: Styles.footnoteEmphasis.copyWith(
              color: AppColors.neutralColor600,
            ),
          ),
          12.horizontalSpace,
          Text(
            cubit.doctorDetails?.data?.gender ?? '',
            style: Styles.footnoteEmphasis.copyWith(
              color: AppColors.neutralColor600,
            ),
          ),
        ],
      ),
    );
  }
}
