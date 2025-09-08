import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:truee_balance_app/core/helper_functions/download_function.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/assets.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/features/doctors/appointments_details/data/model/appointment_details_model.dart';

class DownloadFileWidget extends StatelessWidget {
  const DownloadFileWidget({
    super.key,
    required this.appointmentData,
  });

  final AppointmentData appointmentData;

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
              appointmentData.file != null &&
                      appointmentData.file!.isNotEmpty
                  ? Uri.parse(appointmentData.file!)
                      .pathSegments
                      .last
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
            onTap: appointmentData.file != null &&
                    appointmentData.file!.isNotEmpty
                ? () async {
                    await downloadPdfFile(
                      appointmentData.file!,
                      Uri.parse(appointmentData.file!)
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
                  color: appointmentData.file != null &&
                          appointmentData.file!.isNotEmpty
                      ? AppColors.primaryColor900
                      : AppColors.neutralColor600,
                ),
                Text(
                  'download'.tr(),
                  style: Styles.contentEmphasis.copyWith(
                    fontWeight: FontWeight.w400,
                    color: appointmentData.file != null &&
                            appointmentData.file!.isNotEmpty
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
    );
  }
}
