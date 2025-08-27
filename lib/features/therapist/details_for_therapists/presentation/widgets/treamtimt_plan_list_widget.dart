import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/routing/app_router.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/features/doctors/appointments/data/model/consultation_users_model.dart';
import 'package:truee_balance_app/features/therapist/details_for_therapists/bloc/details_for_therapists_cubit.dart';

class TreamentPlanTherapistListWidget extends StatelessWidget {
  const TreamentPlanTherapistListWidget({
    super.key,
    required this.cubit,
    required this.usersData,
  });

  final DetailsForTherapistsCubit cubit;
  final UserData usersData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        controller: cubit.getSUserTreatmentplansController,
        itemBuilder: (context, index) => Container(
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
              context.pushNamed(Routes.treatmentDetailsForTherapists,
                  arguments: TreatmentArguments(
                      isPending: cubit.isPending!,
                      userData: usersData,
                      treatmentId: cubit
                          .treatmentPlansResponseUserForTherapists!
                          .data!
                          .data![index]
                          .id!,
                      treatmentName: cubit
                          .treatmentPlansResponseUserForTherapists!
                          .data!
                          .data![index]
                          .name!));
            },
            child: Row(
              children: [
                Text(
                  cubit.treatmentPlansResponseUserForTherapists?.data
                          ?.data?[index].name ??
                      '',
                  style: Styles.captionEmphasis.copyWith(
                    color: AppColors.neutralColor600,
                  ),
                ),
                const Spacer(),
                Text("seeDetails".tr(),
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.secondaryColor500,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.secondaryColor500,
                    )),
              ],
            ),
          ),
        ),
        separatorBuilder: (context, index) => 18.verticalSpace,
        itemCount:
            cubit.treatmentPlansResponseUserForTherapists?.data?.data?.length ??
                0,
      ),
    );
  }
}
