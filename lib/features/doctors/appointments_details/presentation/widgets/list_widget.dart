import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';
import 'package:truee_balance_app/features/doctors/appointments_details/bloc/cubit/appointments_details_cubit.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({
    super.key,
    required this.cubit,
  });

  final AppointmentsDetailsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          controller: cubit.scrollController,
          itemBuilder: (context, index) => InkWell(
                onTap: () {},
                child: Container(
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
                          'Appmointemts ${index + 1}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: Styles.captionEmphasis.copyWith(
                            color: AppColors.neutralColor1000,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: cubit.isPending!
                              ? const Color(0xFFFFDB43).withOpacity(0.1)
                              : const Color(0xFF4CAF50).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(
                              AppConstants.borderRadius - 4.r),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 3.h),
                        child: Text(
                          cubit.appointmentDetailsModel!.data!.data![index]
                                      .status ==
                                  'pending'
                              ? 'pending'.tr()
                              : 'completed'.tr(),
                          style: Styles.footnoteRegular.copyWith(
                            color: cubit.appointmentDetailsModel!.data!
                                        .data![index].status ==
                                    'pending'
                                ? AppColors.yellowColor100
                                : const Color(0xFF4CAF50),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          separatorBuilder: (context, index) => 18.verticalSpace,
          itemCount: cubit.appointmentDetailsModel!.data!.data!.length),
    );
  }
}
