import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/features/therapist/treatment_details_for_therapists/bloc/cubit/treatment_details_for_therapist_cubit.dart';
import 'package:truee_balance_app/features/therapist/treatment_details_for_therapists/presentation/screen/sessions_details_therapists.dart';

class SessionListTherapistWidget extends StatelessWidget {
  const SessionListTherapistWidget({super.key, required this.cubit});

  final TreatmentDetailsForTherapistCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        controller: cubit.traetmentforTherapistsscrollController,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(
              builder: (context) => SessionsDetailsTherapists(
                index: index,
                session: cubit
                    .treatmentSessionsResponseForTherapists!.data!.data![index],
              ),
            ))
                .then((v) {
              if (v != null) {
                cubit.treatmentSessionsResponseForTherapists!.data!.data!
                    .removeAt(v);
                cubit.emit(TreatmentDetailsForTherapistStateSuccess());
              }
            });
          },
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
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    '${'Session'.tr()} ${index + 1}',
                    style: Styles.captionEmphasis.copyWith(
                      color: AppColors.neutralColor1000,
                    ),
                  ),
                ),
                // const Spacer(),
                Text(
                  "seeDetails".tr(),
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
          ),
        ),
        separatorBuilder: (context, index) => 18.verticalSpace,
        itemCount:
            cubit.treatmentSessionsResponseForTherapists!.data!.data!.length,
      ),
    );
  }
}
