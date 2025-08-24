import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/features/doctors/appointments/data/model/consultation_users_model.dart';
import 'package:truee_balance_app/features/doctors/appointments_details/bloc/cubit/appointments_details_cubit.dart';
import 'package:truee_balance_app/features/user/my_booking/widgets/custom_row_make_title_and_desc_widget.dart';

class SkltoinWidget extends StatelessWidget {
  const SkltoinWidget({
    super.key,
    required this.userData,
    required this.cubit,
  });

  final UserData userData;
  final AppointmentsDetailsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor900,
      appBar: CustomBasicAppBar(
        leading: BackButton(
          color: AppColors.neutralColor100,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: 'appointments Details',
        backgroundColor: AppColors.primaryColor900,
        svgAsset: 'assets/images/svg/bg_image.svg',
      ),
      body: Skeletonizer(
        enabled: true,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(18.sp),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  topRight: Radius.circular(12.r),
                ),
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
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
                              CachedNetworkImage(
                                imageUrl: userData.image!,
                                width: 55.w,
                                height: 55.h,
                              ),
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
                                          ? const Color(0xFFFFDB43)
                                              .withOpacity(0.1)
                                          : const Color(0xFF4CAF50)
                                              .withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(
                                          AppConstants.borderRadius - 4.r),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.w, vertical: 3.h),
                                    child: Text(
                                      cubit.isPending!
                                          ? 'pending'.tr()
                                          : 'completed'.tr(),
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
                                    "10",
                                    style: Styles.contentEmphasis.copyWith(
                                      color: AppColors.neutralColor1000,
                                    ),
                                  ),
                                ],
                              ),
                              10.verticalSpace,
                              CustomRowMakeTitleAndDescWidget(
                                  title: 'Phone Number ',
                                  description: userData.phone!),
                            ],
                          ),
                        ),
                        18.verticalSpace,
                        Expanded(
                          child: ListView.separated(
                              controller: cubit.scrollController,
                              itemBuilder: (context, index) => InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.all(10.sp),
                                      decoration: BoxDecoration(
                                        color: AppColors.neutralColor100,
                                        borderRadius:
                                            BorderRadius.circular(4.r),
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
                                              style: Styles.captionEmphasis
                                                  .copyWith(
                                                color:
                                                    AppColors.neutralColor1000,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: cubit.isPending!
                                                  ? const Color(0xFFFFDB43)
                                                      .withOpacity(0.1)
                                                  : const Color(0xFF4CAF50)
                                                      .withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      AppConstants
                                                              .borderRadius -
                                                          4.r),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8.w, vertical: 3.h),
                                            child: Text(
                                              'completed'.tr(),
                                              style: Styles.footnoteRegular
                                                  .copyWith(
                                                color: const Color(0xFF4CAF50),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                              separatorBuilder: (context, index) =>
                                  18.verticalSpace,
                              itemCount: 10),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
