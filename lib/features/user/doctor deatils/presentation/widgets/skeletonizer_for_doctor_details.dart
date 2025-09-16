import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/assets.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';
import 'package:truee_balance_app/features/user/doctor%20deatils/data/model/doctor_details_model.dart';
import 'package:truee_balance_app/features/user/doctor%20deatils/presentation/widgets/review_item_widget.dart';

class SkeletonizerForDoctorDetails extends StatelessWidget {
  const SkeletonizerForDoctorDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(18.sp),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.w,
                    color: const Color(0xFF030303).withValues(alpha: 0.1),
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
                      const Color(0xffFCFCFC).withValues(alpha: 0.1),
                      BlendMode.dstATop,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    Text(
                      'Ahmed Hossam',
                      style: Styles.contentBold.copyWith(
                        color: AppColors.neutralColor1000,
                      ),
                    ),
                    12.horizontalSpace,
                    Text(
                      'Specialization Here',
                      style: Styles.footnoteEmphasis.copyWith(
                        color: AppColors.neutralColor600,
                      ),
                    ),
                  ],
                ),
              ),
              10.verticalSpace,
              Text('about'.tr(),
                  style: Styles.contentEmphasis
                      .copyWith(fontWeight: FontWeight.w600, fontSize: 14.sp)),
              const SizedBox(height: 8),
              Text(
                "A Professional Technician With 7 Years Of Experience In Maintaining Modern Electrical Appliances, Kron Provides High-Quality, Prompt Service.",
                style: Styles.contentEmphasis.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: AppColors.neutralColor600),
              ),
              16.verticalSpace,
              Row(
                spacing: 6.sp,
                children: [
                  Text('bestTherapists'.tr(),
                      style: Styles.contentEmphasis.copyWith(
                          fontWeight: FontWeight.w600, fontSize: 14.sp)),
                  const Icon(Icons.star, color: Color(0XFFFFDB43), size: 18),
                  Text(
                    "4.8",
                    style: Styles.contentEmphasis.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: AppColors.neutralColor600),
                  ),
                  Text(
                    " | (4,479 Rate)",
                    style: Styles.contentEmphasis.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: AppColors.neutralColor600),
                  ),
                ],
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) {
                  return 10.verticalSpace;
                },
                itemBuilder: (BuildContext context, int index) {
                  return ReviewItemWidget(
                    userRating: UserRating(
                        date: "10/15/200",
                        userId: 2,
                        userName: 'mohamed',
                        userRate: 4,
                        userMessage: 'sfasfsfsfsafasfasfafafafafafafa'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
