import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:truee_balance_app/core/helper_functions/download_function.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/assets.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';

class MedicalReportItemWidget extends StatelessWidget {
  const MedicalReportItemWidget({
    super.key,
    required this.item,
    required this.date,
    required this.time,
  });

  final String item;
  final String time;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        children: [
          Row(
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
                  Uri.parse(item).pathSegments.last,
                  style: Styles.contentEmphasis.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(width: 10.sp),
              if (item.isNotEmpty)
                InkWell(
                  onTap: () async {
                    await downloadPdfFile(
                      item,
                      Uri.parse(item).pathSegments.last,
                    );
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.download_outlined,
                        size: 20.sp,
                        color: AppColors.primaryColor900,
                      ),
                      Text(
                        'download'.tr(),
                        style: Styles.contentEmphasis.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryColor900,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          SizedBox(height: 10.sp),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '$date / $time',
                style: Styles.contentEmphasis.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.neutralColor600,
                  fontSize: 12.sp,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
