// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:true_balance_app/core/themes/app_colors.dart';
// import 'package:true_balance_app/core/themes/text_colors.dart';

// class CustomBookingContainerWidget extends StatelessWidget {
//   final String date;
//   final String time;
//   final String status;

//   const CustomBookingContainerWidget({
//     super.key,
//     required this.date,
//     required this.time,
//     required this.status,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.all(12.sp),
//       decoration: BoxDecoration(
//         color: AppColors.neutralColor100,
//         borderRadius: BorderRadius.circular(12.r),
//         border: Border.all(
//           color: AppColors.neutralColor1000.withAlpha(20),
//           width: 1.w,
//         ),
//         boxShadow: [
//           BoxShadow(
//             offset: Offset(0, 2.h),
//             blurRadius: 8.r,
//             spreadRadius: 0,
//             color: Colors.black.withAlpha(20),
//           ),
//         ],
//       ),
//       child: Column(
//         spacing: 6.h,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Date: $date",
//             style: Styles.contentBold.copyWith(
//               color: AppColors.neutralColor1000,
//             ),
//           ),
//           Text(
//             "Time: $time",
//             style: Styles.footnoteEmphasis.copyWith(
//               color: AppColors.neutralColor600,
//             ),
//           ),
//           Text(
//             "Status: $status",
//             style: Styles.footnoteEmphasis.copyWith(
//               color: status == "pending"
//                   ? Colors.orange
//                   : status == "completed"
//                       ? Colors.green
//                       : Colors.red,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:true_balance_app/core/themes/text_colors.dart';

class CustomBookingContainerWidget extends StatelessWidget {
  final String date;
  final String time;
  final String status;

  const CustomBookingContainerWidget({
    super.key,
    required this.date,
    required this.time,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final isPending = status == "pending";
    final isConfirmed = status == "confirmed";

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: const Color(0xFFE0E0E0),
          width: 1.w,
        ),
      ),
      child: Column(
        spacing: 6.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (isPending || isConfirmed)
                Container(
                  margin: EdgeInsets.only(right: 8.w),
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: isPending
                        ? Colors.grey.shade500
                        : Colors.green.shade500,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Text(
                    isPending ? 'reserved'.tr() : 'confirmed'.tr(),
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              Expanded(
                child: Text(
                  "${'date'.tr()}: $date",
                  style: Styles.contentBold.copyWith(
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
            ],
          ),
          Text(
            "${'time'.tr()}: $time",
            style: Styles.footnoteEmphasis.copyWith(
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
