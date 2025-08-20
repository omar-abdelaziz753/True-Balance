import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/images/cache_network_image/image_widget.dart';
import 'package:truee_balance_app/features/user/add%20session/bloc/cubit/add_session_cubit.dart';
import 'package:truee_balance_app/features/user/add%20session/presentation/widgets/details_row_widget.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({
    super.key,
    required this.cubit,
  });

  final AddSessionCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12.sp,
      children: [
        Container(
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
                color: Colors.black.withAlpha(20),
              ),
            ],
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: CacheNetworkImagesWidget(
                  image: cubit.treatmentPlanDetail.therapist.image,
                  width: 55.w,
                  height: 55.h,
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: Column(
                  spacing: 4.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cubit.treatmentPlanDetail.therapist.name,
                      style: Styles.contentBold.copyWith(
                        color: AppColors.neutralColor1000,
                      ),
                    ),
                    Text(
                      cubit.treatmentPlanDetail.therapist.specialization,
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
        ),
        Container(
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
                color: Colors.black.withAlpha(20),
              ),
            ],
          ),
          child: Column(
            spacing: 12.sp,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailsRowWidget(
                label: "treatmentname".tr(),
                value: cubit.treatmentPlanDetail.name,
              ),
              DetailsRowWidget(
                label: "totalOfSession".tr(),
                value: cubit.treatmentPlanDetail.totalSessions.toString(),
              ),
              DetailsRowWidget(
                label: "bookingIsComplete".tr(),
                value: cubit.treatmentPlanDetail.completedSessions.toString(),
              ),
              DetailsRowWidget(
                label: "remainingReservationsAreRequired".tr(),
                value: cubit.treatmentPlanDetail.uncompletedSessions.toString(),
              ),
              DetailsRowWidget(
                label: "typeoftreatment".tr(),
                value: cubit.treatmentPlanDetail.type,
              ),
              // _buildRow("Treatment Name", cubit.treatmentPlanDetail.name),
              // _buildRow("Total Of Session",
              //     cubit.treatmentPlanDetail.totalSessions.toString()),
              // _buildRow("Booking Is Complete",
              //     cubit.treatmentPlanDetail.completedSessions.toString()),
              // _buildRow("Remaining Reservations Are Required",
              //     cubit.treatmentPlanDetail.uncompletedSessions.toString()),
              // _buildRow("Type Of Treatment", cubit.treatmentPlanDetail.type),
              Text(
                "notes".tr(),
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              Text(
                cubit.treatmentPlanDetail.description ?? "",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 150.sp)
            ],
          ),
        ),
      ],
    );
  }
}
