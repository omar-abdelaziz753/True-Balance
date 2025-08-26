import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/features/doctors/appointments/data/model/consultation_users_model.dart';
import 'package:truee_balance_app/features/therapist/treatment_details_for_therapists/bloc/cubit/treatment_details_for_therapist_cubit.dart';
import 'package:truee_balance_app/features/therapist/treatment_details_for_therapists/presentation/widgets/session_list_widget.dart';
import 'package:truee_balance_app/features/therapist/treatment_details_for_therapists/presentation/widgets/sesson_list_skeloton_widget.dart';
import 'package:truee_balance_app/features/therapist/treatment_details_for_therapists/presentation/widgets/user_widget.dart';

class TreatmentDetailsForTherapists extends StatelessWidget {
  const TreatmentDetailsForTherapists(
      {super.key, required this.userData, required this.treatmentName});
  final UserData userData;
  final String treatmentName;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TreatmentDetailsForTherapistCubit>();
    return BlocBuilder<TreatmentDetailsForTherapistCubit,
        TreatmentDetailsForTherapistState>(
      buildWhen: (previous, current) =>
          current is TreatmentDetailsForTherapistStateSuccess ||
          current is TreatmentDetailsForTherapistStateLoading ||
          current is TreatmentDetailsForTherapistStateError,
      builder: (context, state) {
        if (state is TreatmentDetailsForTherapistStateLoading) {
          return const SessionSkeltionWidget();
        }
        return Scaffold(
          backgroundColor: AppColors.primaryColor900,
          appBar: CustomBasicAppBar(
            leading: BackButton(
              color: AppColors.neutralColor100,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: 'treatment Details'.tr(),
            backgroundColor: AppColors.primaryColor900,
            svgAsset: 'assets/images/svg/bg_image.svg',
          ),
          body: Container(
            width: double.infinity,
            padding: EdgeInsets.all(18.sp),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r),
              ),
            ),
            child: Column(
              children: [
                UserWidgetTheripst(userData: userData),
                18.verticalSpace,
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
                            cubit.treatmentSessionsResponseForTherapists!.data!
                                .data!.length
                                .toString(),
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
                            treatmentName,
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
                        "Notes..",
                        style: Styles.contentEmphasis.copyWith(
                          color: AppColors.neutralColor1000,
                        ),
                      ),
                    ],
                  ),
                ),
                18.verticalSpace,
                SessionListTherapistWidget(cubit: cubit),
                BlocBuilder<TreatmentDetailsForTherapistCubit,
                    TreatmentDetailsForTherapistState>(
                  buildWhen: (previous, current) =>
                      current is TreatmentDetailsForTherapistStateSuccess ||
                      current is TreatmentDetailsForTherapistStateLoadingMore,
                  builder: (context, state) {
                    if (state is TreatmentDetailsForTherapistStateLoadingMore) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
