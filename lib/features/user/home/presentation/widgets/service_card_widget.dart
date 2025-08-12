import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';
import 'package:truee_balance_app/core/widgets/images/cache_network_image/image_widget.dart';

// // class ServiceCardWidget extends StatelessWidget {
// //   const ServiceCardWidget({
// //     super.key,
// //     required this.title,
// //   });

// //   final String title;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       decoration: BoxDecoration(
// //         color: AppColors.neutralColor100,
// //         borderRadius: BorderRadius.circular(AppConstants.borderRadius),
// //         border: Border.all(
// //           width: 1.w,
// //           color: const Color(0xFF030303).withOpacity(0.1),
// //         ),
// //       ),
// //       child: Padding(
// //         padding: const EdgeInsets.all(18.0),
// //         child: Column(
// //           children: [
// //             SvgPicture.asset(
// //               "assets/images/svg/physiotherapy.svg",
// //               width: 44.w,
// //               height: 44.h,
// //             ),
// //             8.verticalSpace,
// //             Text(
// //               title,
// //               style: Styles.captionRegular.copyWith(
// //                 color: AppColors.neutralColor1000,
// //               ),
// //               overflow: TextOverflow.ellipsis,
// //               textAlign: TextAlign.center,
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:truee_balance_app/core/themes/app_colors.dart';
// import 'package:truee_balance_app/core/themes/text_colors.dart';
// import 'package:truee_balance_app/core/utils/app_constants.dart';
// import 'package:truee_balance_app/core/widgets/images/cache_network_image/image_widget.dart';

// class ServiceCardWidget extends StatelessWidget {
//   const ServiceCardWidget(
//       {super.key, required this.title, required this.image});
//   final String title;
//   final String image;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: AppColors.neutralColor100,
//         borderRadius: BorderRadius.circular(AppConstants.borderRadius),
//         border: Border.all(
//           width: 1.w,
//           color: const Color(0xFF030303).withOpacity(0.1),
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(18.0),
//         child: Column(
//           children: [
//             CacheNetworkImagesWidget(image: image ,
//             width: 44.w,
//             height: 44.h,
//             ),
//             // Image.asset(
//             //   image,
//             //   width: 44.w,
//             //   height: 44.h,
//             // ),
//             8.verticalSpace,
//             Text(
//               title,
//               style: Styles.captionRegular.copyWith(
//                 color: AppColors.neutralColor1000,
//               ),
//               overflow: TextOverflow.ellipsis,
//               textAlign: TextAlign.center,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
class ServiceCardWidget extends StatelessWidget {
  const ServiceCardWidget({
    super.key,
    required this.title,
    required this.image,
  });

  final String? title; // خليها nullable عشان نحميها
  final String? image; // خليها nullable برضه

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.neutralColor100,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        border: Border.all(
          width: 1.w,
          color: const Color(0xFF030303).withOpacity(0.1),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            CacheNetworkImagesWidget(
              image: image?.isNotEmpty == true
                  ? image!
                  : 'assets/images/png/placeholder.png', // صورة بديلة
              width: 44.w,
              height: 44.h,
            ),
            8.verticalSpace,
            Text(
              title ?? '---', // نص بديل لو null
              style: Styles.captionRegular.copyWith(
                color: AppColors.neutralColor1000,
              ),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
