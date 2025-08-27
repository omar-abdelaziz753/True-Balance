import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/features/doctors/appointments/data/model/consultation_users_model.dart';
import 'package:truee_balance_app/features/therapist/details_for_therapists/bloc/details_for_therapists_cubit.dart';
import 'package:truee_balance_app/features/therapist/details_for_therapists/presentation/widgets/skelotin_widget.dart';
import 'package:truee_balance_app/features/therapist/details_for_therapists/presentation/widgets/treamtimt_plan_list_widget.dart';
import 'package:truee_balance_app/features/therapist/treatment_details_for_therapists/presentation/widgets/user_widget.dart';

class TreatmentPlanForTherapists extends StatelessWidget {
  const TreatmentPlanForTherapists({
    super.key,
    required this.usersData,
  });
  final UserData usersData;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DetailsForTherapistsCubit>();
    return BlocBuilder<DetailsForTherapistsCubit, DetailsForTherapistsState>(
      buildWhen: (previous, current) =>
          current is GetSUserTreatmentplansErrorState ||
          current is GetSUserTreatmentplansSuccessState ||
          current is GetSUserTreatmentplansLoadingState,
      builder: (context, state) {
        if (state is GetSUserTreatmentplansLoadingState) {
          return TheripstTermentPlanSkeltonizerWidget(usersData: usersData);
        }
        return Scaffold(
          backgroundColor: AppColors.primaryColor900,
          appBar: CustomBasicAppBar(
            leading: BackButton(
              color: AppColors.neutralColor100,
            ),
            title: 'treatmentPlans'.tr(),
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
                UserWidgetTheripst(userData: usersData),
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
                  child: Row(
                    children: [
                      Text(
                        "totalOftreatment".tr(),
                        style: Styles.captionEmphasis.copyWith(
                          color: AppColors.neutralColor600,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "${cubit.treatmentPlansResponseUserForTherapists?.data?.data?.length ?? 0}",
                        style: Styles.contentEmphasis.copyWith(
                          color: AppColors.neutralColor1000,
                        ),
                      ),
                    ],
                  ),
                ),
                18.verticalSpace,
                TreamentPlanTherapistListWidget(
                    cubit: cubit, usersData: usersData),
                BlocBuilder<DetailsForTherapistsCubit,
                    DetailsForTherapistsState>(
                  buildWhen: (previous, current) =>
                      current is GetSUserTreatmentplansLoadingMore ||
                      current is GetSUserTreatmentplansSuccessState,
                  builder: (context, state) {
                    if (state is GetSUserTreatmentplansLoadingMore) {
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
