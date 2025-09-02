import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:truee_balance_app/core/helper_functions/download_function.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/assets.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/features/user/my_booking/data/models/Consultations/consultations_response.dart';
import 'package:truee_balance_app/features/user/my_booking/widgets/custom_row_make_title_and_desc_widget.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key, required this.consultation});
  final Consultation consultation;
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
        title: 'bookingDetails'.tr(),
        backgroundColor: AppColors.primaryColor900,
        svgAsset: 'assets/images/svg/bg_image.svg',
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(18.sp), // Keep this for container padding
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
                    spacing: 18.h,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(12.sp),
                        decoration: BoxDecoration(
                          color: AppColors.neutralColor100,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 2.h),
                              blurRadius: 8.r,
                              spreadRadius: 0,
                              color: Colors.black.withAlpha(20),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: AppColors.neutralColor1000.withAlpha(20),
                            width: 1.sp,
                          ),
                        ),
                        child: Column(
                          spacing: 12.h,
                          children: [
                            CustomRowMakeTitleAndDescWidget(
                              title: 'date'.tr(),
                              description: consultation.date,
                            ),
                            CustomRowMakeTitleAndDescWidget(
                              title: 'time'.tr(),
                              description: consultation.time,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(12.sp),
                        decoration: BoxDecoration(
                          color: AppColors.neutralColor100,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 2.h),
                              blurRadius: 8.r,
                              spreadRadius: 0,
                              color: Colors.black.withAlpha(20),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: AppColors.neutralColor1000.withAlpha(20),
                            width: 1.sp,
                          ),
                        ),
                        child: Column(
                          spacing: 12.h,
                          children: [
                            CustomRowMakeTitleAndDescWidget(
                              title: 'doctorName'.tr(),
                              description: consultation.doctor.name,
                            ),
                            CustomRowMakeTitleAndDescWidget(
                              title: 'phoneNumberOnly'.tr(),
                              description: consultation.doctor.phone,
                            ),
                            CustomRowMakeTitleAndDescWidget(
                              title: 'doctorEvaluation'.tr(),
                              description: consultation.doctorEvaluation ?? "",
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.sp,
                                vertical: 8.sp,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.sp),
                                border: Border.all(
                                  width: 1.sp,
                                  color: AppColors.neutralColor600,
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12.sp),
                                    child: SvgPicture.asset(
                                      Assets.assetsImagesSvgPdfIcon,
                                      height: 36.sp,
                                      width: 36.sp,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 10.sp),
                                  Expanded(
                                    child: Text(
                                      consultation.file != null &&
                                              consultation.file!.isNotEmpty
                                          ? Uri.parse(consultation.file!)
                                              .pathSegments
                                              .last
                                          : "noFileAttached".tr(),
                                      style: Styles.contentEmphasis.copyWith(
                                        fontWeight: FontWeight.w700,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: consultation.file != null &&
                                            consultation.file!.isNotEmpty
                                        ? () async {
                                            await downloadPdfFile(
                                              consultation.file!,
                                              Uri.parse(consultation.file!)
                                                  .pathSegments
                                                  .last,
                                            );
                                          }
                                        : null,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.download_outlined,
                                          size: 20.sp,
                                          color: consultation.file != null &&
                                                  consultation.file!.isNotEmpty
                                              ? AppColors.primaryColor900
                                              : AppColors.neutralColor600,
                                        ),
                                        Text(
                                          'download'.tr(),
                                          style:
                                              Styles.contentEmphasis.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: consultation.file != null &&
                                                    consultation
                                                        .file!.isNotEmpty
                                                ? AppColors.primaryColor900
                                                : AppColors.neutralColor600,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Container(
                      //   padding: EdgeInsets.all(12.sp),
                      //   decoration: BoxDecoration(
                      //     color: AppColors.neutralColor100,
                      //     boxShadow: [
                      //       BoxShadow(
                      //         offset: Offset(0, 2.h),
                      //         blurRadius: 8.r,
                      //         spreadRadius: 0,
                      //         color: Colors.black.withAlpha(20),
                      //       ),
                      //     ],
                      //     borderRadius: BorderRadius.circular(12.r),
                      //     border: Border.all(
                      //       color: AppColors.neutralColor1000.withAlpha(20),
                      //       width: 1.sp,
                      //     ),
                      //   ),
                      //   child: Column(
                      //     spacing: 12.h,
                      //     children: [
                      //       CustomRowMakeTitleAndDescWidget(
                      //         title: 'total'.tr(),
                      //         description: '\$150.00',
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Positioned(
          //   left: 18.w,
          //   right: 18.w,
          //   bottom: 32.h,
          // child: CustomButtonWidget(
          //   padding: EdgeInsets.symmetric(vertical: 14.h),
          //   text: 'tipsForBetterExperience'.tr(),
          //   textStyle: Styles.captionEmphasis.copyWith(
          //     color: AppColors.neutralColor100,
          //   ),
          //   onPressed: () {
          //     showChangePasswordBottomSheet(context,
          //         title1: "ourTicket".tr(),
          //         title2: "successfully".tr(),
          //         description: "yourTicketIsNow".tr(),
          //         buttonText: "ok".tr(), onPressed: () {
          //       Navigator.pop(context);
          //     });
          //   },
          // ),
          // ),
        ],
      ),
    );
  }
}
