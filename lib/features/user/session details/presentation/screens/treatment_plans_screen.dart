import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/core/widgets/images/cache_network_image/image_widget.dart';
import 'package:truee_balance_app/features/user/session%20details/bloc/cubit/session_details_cubit.dart';

class TreatmentPlansScreen extends StatelessWidget {
  const TreatmentPlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SessionDetailsCubit>();
    return BlocBuilder<SessionDetailsCubit, SessionDetailsState>(
      buildWhen: (previous, current) =>
          previous is GetByTherapistLoadingState ||
          current is GetByTherapistSuccessState ||
          current is GetByTherapistFailureState,
      builder: (context, state) {
        if (state is GetByTherapistLoadingState) {
          return Scaffold(
            backgroundColor: AppColors.primaryColor900,
            appBar: CustomBasicAppBar(
              title: 'treatmentPlans'.tr(),
              backgroundColor: AppColors.primaryColor900,
              svgAsset: 'assets/images/svg/bg_image.svg',
            ),
            body: Skeletonizer(
              enabled: true,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(18.sp),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    topRight: Radius.circular(12.r),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
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
                              spreadRadius: 0,
                              color: Colors.black.withAlpha(20),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12.r),
                              child: Image.asset(
                                width: 55.w,
                                height: 55.h,
                                "assets/images/png/profile_image_booking.png",
                              ),
                            ),
                            12.horizontalSpace,
                            Expanded(
                              child: Column(
                                spacing: 4.h,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Ahmed Hossam",
                                    style: Styles.contentBold.copyWith(
                                      color: AppColors.neutralColor1000,
                                    ),
                                  ),
                                  Text(
                                    "Specialization Here",
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
                              "Total Of treatment",
                              style: Styles.captionEmphasis.copyWith(
                                color: AppColors.neutralColor600,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "10",
                              style: Styles.contentEmphasis.copyWith(
                                color: AppColors.neutralColor1000,
                              ),
                            ),
                          ],
                        ),
                      ),
                      18.verticalSpace,
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => Container(
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
                                "treatment name",
                                style: Styles.captionEmphasis.copyWith(
                                  color: AppColors.neutralColor600,
                                ),
                              ),
                              const Spacer(),
                              Text("See Details",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.secondaryColor500,
                                    decoration: TextDecoration.underline,
                                    decorationColor:
                                        AppColors.secondaryColor500,
                                  )),
                            ],
                          ),
                        ),
                        separatorBuilder: (context, index) => 18.verticalSpace,
                        itemCount: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return Scaffold(
          backgroundColor: AppColors.primaryColor900,
          appBar: CustomBasicAppBar(
            title: cubit.treatmentPlansResponse?.data!.therapist?.name ?? '',
            backgroundColor: AppColors.primaryColor900,
            svgAsset: 'assets/images/svg/bg_image.svg',
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
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
                        spreadRadius: 0,
                        color: Colors.black.withAlpha(20),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: CacheNetworkImagesWidget(
                            image: cubit.treatmentPlansResponse?.data?.therapist
                                    ?.image ??
                                '',
                            width: 55.w,
                            height: 55.h,
                          )),
                      12.horizontalSpace,
                      Expanded(
                        child: Column(
                          spacing: 4.h,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cubit.treatmentPlansResponse?.data?.therapist
                                      ?.name ??
                                  '',
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
                ),
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
                        "Total Of treatment",
                        style: Styles.captionEmphasis.copyWith(
                          color: AppColors.neutralColor600,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "${cubit.treatmentPlansResponse?.data?.treatmentPlans!.length ?? "0"}",
                        style: Styles.contentEmphasis.copyWith(
                          color: AppColors.neutralColor1000,
                        ),
                      ),
                    ],
                  ),
                ),
                18.verticalSpace,
                Expanded(
                  child: ListView.separated(
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
                          context.pushNamed(
                            Routes.treatmentdetailsScreen,
                            arguments: cubit.treatmentPlansResponse?.data
                                    ?.treatmentPlans?[index].id ??
                                0,
                          );
                        },
                        child: Row(
                          spacing: 10.sp,
                          children: [
                            Expanded(
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                cubit.treatmentPlansResponse?.data
                                        ?.treatmentPlans?[index].name ??
                                    '',
                                style: Styles.captionEmphasis.copyWith(
                                  color: AppColors.neutralColor1000,
                                ),
                              ),
                            ),
                            // const Spacer(),
                            Text(
                              "See Details",
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
                    itemCount: cubit.treatmentPlansResponse?.data
                            ?.treatmentPlans?.length ??
                        0,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
