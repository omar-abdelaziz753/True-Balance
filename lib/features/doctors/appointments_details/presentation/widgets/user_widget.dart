import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';
import 'package:truee_balance_app/features/doctors/appointments/data/model/consultation_users_model.dart';
import 'package:truee_balance_app/features/doctors/appointments_details/bloc/cubit/appointments_details_cubit.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({
    super.key,
    required this.userData,
    required this.cubit,
  });

  final UserData userData;
  final AppointmentsDetailsCubit cubit;

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
          CachedNetworkImage(
              imageUrl: userData.image ?? "",
              width: 55.w,
              height: 55.h,
              errorWidget: (context, url, error) => Icon(
                    Icons.error,
                    size: 55.sp,
                    color: Colors.grey,
                  )),
          // CachedNetworkImage(
          //   imageUrl: userData.image!,
          //   width: 55.w,
          //   height: 55.h,
          // ),
          12.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userData.name!,
                style: Styles.contentBold.copyWith(
                  color: AppColors.neutralColor1000,
                ),
              ),
              SizedBox(height: 4.h),
              Container(
                decoration: BoxDecoration(
                  color: cubit.isPending!
                      ? const Color(0xFFFFDB43).withValues(alpha: 0.1)
                      : const Color(0xFF4CAF50).withValues(alpha: 0.1),
                  borderRadius:
                      BorderRadius.circular(AppConstants.borderRadius - 4.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                child: Text(
                  cubit.isPending! ? 'pending'.tr() : 'completed'.tr(),
                  style: Styles.footnoteRegular.copyWith(
                    color: cubit.isPending!
                        ? AppColors.yellowColor100
                        : const Color(0xFF4CAF50),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
