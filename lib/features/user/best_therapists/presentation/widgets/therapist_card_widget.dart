import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/assets.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';

class TherapistCardWidget extends StatelessWidget {
  const TherapistCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(Routes.doctorDetailsScreen);
      },
      child: Container(
        width: double.infinity,
        // margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.w,
            color: const Color(0xff0303031).withOpacity(0.1),
          ),
          borderRadius: BorderRadius.circular(
            AppConstants.borderRadius + 4.r,
          ),
          color: const Color(0xffFCFCFC),
          image: DecorationImage(
            image: const AssetImage(
              "assets/images/png/back_ground_best_therapists.png",
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              const Color(0xffFCFCFC).withOpacity(0.1),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 90.w,
              alignment: Alignment.center,
              child: ClipOval(
                child: Image.asset(
                  Assets.assetsImagesPngBestTherapistsDoctor,
                  width: 95.w,
                  height: 91.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            12.horizontalSpace,
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Specialization Here',
                      style: Styles.footnoteEmphasis.copyWith(
                        color: AppColors.neutralColor600,
                      ),
                    ),
                    4.verticalSpace,
                    Text(
                      'Ahmed Hossam',
                      style: Styles.contentBold.copyWith(
                        color: AppColors.neutralColor1000,
                      ),
                    ),
                    8.verticalSpace,
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColors.yellowColor100,
                          size: 20.sp,
                        ),
                        4.horizontalSpace,
                        Text(
                          '4.8 | (4,479 Rate)',
                          style: Styles.footnoteEmphasis.copyWith(
                            color: AppColors.neutralColor600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





class TherapistCardSkeltonWidget extends StatelessWidget {
  const TherapistCardSkeltonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.w,
          color: const Color(0xff0303031).withOpacity(0.1),
        ),
        borderRadius: BorderRadius.circular(
          AppConstants.borderRadius + 4.r,
        ),
        color: const Color(0xffFCFCFC),
        image: DecorationImage(
          image: const AssetImage(
            "assets/images/png/back_ground_best_therapists.png",
          ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            const Color(0xffFCFCFC).withOpacity(0.1),
            BlendMode.dstATop,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 90.w,
            alignment: Alignment.center,
            child: ClipOval(
              child: Image.asset(
                Assets.assetsImagesPngBestTherapistsDoctor,
                width: 95.w,
                height: 91.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          12.horizontalSpace,
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Specialization Here',
                    style: Styles.footnoteEmphasis.copyWith(
                      color: AppColors.neutralColor600,
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    'Ahmed Hossam',
                    style: Styles.contentBold.copyWith(
                      color: AppColors.neutralColor1000,
                    ),
                  ),
                  8.verticalSpace,
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: AppColors.yellowColor100,
                        size: 20.sp,
                      ),
                      4.horizontalSpace,
                      Text(
                        '4.8 | (4,479 Rate)',
                        style: Styles.footnoteEmphasis.copyWith(
                          color: AppColors.neutralColor600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
