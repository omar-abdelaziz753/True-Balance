// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:skeletonizer/skeletonizer.dart';
// import 'package:truee_balance_app/core/themes/app_colors.dart';
// import 'package:truee_balance_app/core/themes/text_colors.dart';

// class CustomAppointmentContainerWidget extends StatelessWidget {
//   final String title;
//   final String phone;
//   final String imagePath;
//   final bool isLoading;

//   const CustomAppointmentContainerWidget({
//     super.key,
//     required this.title,
//     required this.phone,
//     required this.imagePath,
//     this.isLoading = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Skeletonizer(
//       enabled: isLoading,
//       child: Container(
//         width: double.infinity,
//         padding: EdgeInsets.all(12.sp),
//         decoration: BoxDecoration(
//           color: AppColors.neutralColor100,
//           borderRadius: BorderRadius.circular(12.r),
//           border: Border.all(
//             color: AppColors.neutralColor1000.withAlpha(20),
//             width: 1.w,
//           ),
//           boxShadow: [
//             BoxShadow(
//               offset: Offset(0, 2.h),
//               blurRadius: 8.r,
//               spreadRadius: 0,
//               color: Colors.black.withAlpha(20),
//             ),
//           ],
//         ),
//         child: Row(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(12.r),
//               child: isLoading
//                   ? Container(
//                       width: 95.w,
//                       height: 95.h,
//                       color: Colors.grey[300],
//                     )
//                   : Hero(
//                       tag: imagePath ?? "",
//                       child: CachedNetworkImage(
//                           imageUrl: imagePath,
//                           width: 95.w,
//                           height: 95.h,
//                           errorWidget: (context, url, error) =>
//                               Image.asset("assets/images/png/profile2.png")
//                           // Icon(
//                           //   Icons.error,
//                           //   size: 95.sp,
//                           //   color: Colors.grey,
//                           // ),
//                           ),
//                     ),
//             ),
//             12.horizontalSpace,
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: Styles.contentBold.copyWith(
//                       color: AppColors.neutralColor1000,
//                     ),
//                   ),
//                   SizedBox(height: 4.h),
//                   Text(
//                     phone,
//                     style: Styles.footnoteEmphasis.copyWith(
//                       color: AppColors.neutralColor600,
//                     ),
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';

class CustomAppointmentContainerWidget extends StatelessWidget {
  final String title;
  final String phone;
  final String imagePath;
  final int? age;
  final String? gender;
  final bool isLoading;

  const CustomAppointmentContainerWidget({
    super.key,
    required this.title,
    required this.phone,
    required this.imagePath,
    this.age,
    this.gender,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: Container(
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
              child: isLoading
                  ? Container(
                      width: 95.w,
                      height: 95.h,
                      color: Colors.grey[300],
                    )
                  : Hero(
                      tag: imagePath,
                      child: CachedNetworkImage(
                        imageUrl: imagePath,
                        width: 95.w,
                        height: 95.h,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) =>
                            Image.asset("assets/images/png/profile2.png"),
                      ),
                    ),
            ),
            12.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Styles.contentBold.copyWith(
                      color: AppColors.neutralColor1000,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    phone,
                    style: Styles.footnoteEmphasis.copyWith(
                      color: AppColors.neutralColor600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (age != null) ...[
                    SizedBox(height: 4.h),
                    Text(
                      "${"age".tr()}: $age".toString(),
                      style: Styles.footnoteEmphasis.copyWith(
                        color: AppColors.neutralColor600,
                      ),
                    ),
                  ],
                  if (gender != null) ...[
                    SizedBox(height: 2.h),
                    Text(
                      "${"gender".tr()}: $gender",
                      style: Styles.footnoteEmphasis.copyWith(
                        color: AppColors.neutralColor600,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
