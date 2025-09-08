import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:truee_balance_app/core/helper_functions/download_function.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/assets.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/features/user/session%20details/data/model/treatment_plan_detail.dart';

class SessionCompletedWidget extends StatelessWidget {
  const SessionCompletedWidget({super.key, required this.session});

  final Session session;

  @override
  Widget build(BuildContext context) {
    return Column(
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
            spacing: 12.sp,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'notes'.tr(),
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              Text(
                session.notes ?? "",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 8.sp),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      session.file ?? "",
                      style: Styles.contentEmphasis.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () async {
                  await downloadPdfFile(session.file ?? "",
                      Uri.parse(session.file ?? "").pathSegments.last);
                },
                icon: Row(
                  children: [
                    Icon(
                      Icons.download_outlined,
                      size: 20.sp,
                      color: AppColors.primaryColor800,
                    ),
                    Text(
                      'download'.tr(),
                      style: Styles.contentEmphasis.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryColor800,
                          fontSize: 12.sp),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
