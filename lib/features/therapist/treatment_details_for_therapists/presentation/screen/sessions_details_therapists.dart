import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:truee_balance_app/core/helper_functions/download_function.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/assets.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';
import 'package:truee_balance_app/features/therapist/treatment_details_for_therapists/data/model/treatment_sessions_response_for_therapists.dart';
import 'package:truee_balance_app/features/therapist/treatment_details_for_therapists/presentation/widgets/show_butom_sheet_for_session.dart';
import 'package:truee_balance_app/features/user/add%20session/presentation/widgets/details_row_widget.dart';

class SessionsDetailsTherapists extends StatelessWidget {
  const SessionsDetailsTherapists(
      {super.key, required this.session, required this.index});
  final TreatmentSession session;
  final int index;
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
        title: '${'Session'.tr()} ${index + 1}',
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
          spacing: 15.sp,
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
                    color: Colors.black.withAlpha(20),
                  ),
                ],
              ),
              child: Column(
                spacing: 10.sp,
                children: [
                  DetailsRowWidget(
                      label: 'sessionData'.tr(), value: session.date ?? ""),
                  DetailsRowWidget(
                      label: 'sessionTime'.tr(), value: session.time ?? ""),
                  if (session.status == 'completed') ...[
                    DetailsRowWidget(
                        label: 'notes'.tr(), value: session.notes ?? ""),
                    DetailsRowWidget(
                        label: 'rating'.tr(), value: session.rating ?? ""),
                    DetailsRowWidget(
                        label: 'review'.tr(), value: session.review ?? ""),
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
                              session.file != null && session.file!.isNotEmpty
                                  ? Uri.parse(session.file!).pathSegments.last
                                  : "noFileAttached".tr(),
                              style: Styles.contentEmphasis.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          10.horizontalSpace,
                          InkWell(
                            onTap:
                                session.file != null && session.file!.isNotEmpty
                                    ? () async {
                                        await downloadPdfFile(
                                          session.file!,
                                          Uri.parse(session.file!)
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
                                  color: session.file != null &&
                                          session.file!.isNotEmpty
                                      ? AppColors.primaryColor900
                                      : AppColors.neutralColor600,
                                ),
                                Text(
                                  'download'.tr(),
                                  style: Styles.contentEmphasis.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: session.file != null &&
                                            session.file!.isNotEmpty
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
                  ]
                ],
              ),
            ),
            if (session.status != "completed") ...[
              const Spacer(),
              CustomButtonWidget(
                text: 'completed'.tr(),
                onPressed: () {
                  showRatingBottomSheetForSession(context, session.id!, index);
                },
              )
            ]
          ],
        ),
      ),
    );
  }
}
