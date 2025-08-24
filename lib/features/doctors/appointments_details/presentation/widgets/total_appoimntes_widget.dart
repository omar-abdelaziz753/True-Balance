import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/features/doctors/appointments/data/model/consultation_users_model.dart';
import 'package:truee_balance_app/features/doctors/appointments_details/bloc/cubit/appointments_details_cubit.dart';
import 'package:truee_balance_app/features/user/my_booking/widgets/custom_row_make_title_and_desc_widget.dart';

class TotalApmointesWIdget extends StatelessWidget {
  const TotalApmointesWIdget({
    super.key,
    required this.cubit,
    required this.userData,
  });

  final AppointmentsDetailsCubit cubit;
  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
            children: [
              Row(
                children: [
                  Text(
                    'Total of Appmointemts'.tr(),
                    style: Styles.captionEmphasis.copyWith(
                      color: AppColors.neutralColor600,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "${cubit.appointmentDetailsModel?.data?.data!.length ?? "0"}",
                    style: Styles.contentEmphasis.copyWith(
                      color: AppColors.neutralColor1000,
                    ),
                  ),
                ],
              ),
              10.verticalSpace,
              CustomRowMakeTitleAndDescWidget(
                  title: 'Phone Number ', description: userData.phone!),
            ],
          ),
        ),
      ],
    );
  }
}
