import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';

// class FormWidget extends StatelessWidget {
//   const FormWidget({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           18.verticalSpace,
//           Text(
//             "serviceType".tr(),
//             style: Styles.highlightAccent,
//           ),
//           8.verticalSpace,
//           CustomDropdownButtonWidget(
//             hint: 'selectItem'.tr(),
//             items: [
//               "home",
//               "home",
//               "home",
//             ],
//           ),
//           18.verticalSpace,
//           Text(
//             "yourLocation".tr(),
//             style: Styles.highlightAccent,
//           ),
//           12.verticalSpace,
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
//             decoration: BoxDecoration(
//               color: AppColors.neutralColor100.withValues(alpha: 0.1),
//               borderRadius: BorderRadius.circular(10.r),
//               border: Border.all(
//                 color: AppColors.neutralColor300,
//               ),
//             ),
//             child: Row(
//               children: [
//                 SvgPicture.asset(
//                   Assets.assetsImagesSvgMyAddressesIcon,
//                 ),
//                 10.horizontalSpace,
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "myAddress".tr(),
//                         style: Styles.contentAccent,
//                       ),
//                       4.verticalSpace,
//                       Text(
//                         "123 Main St, Anytown, USA",
//                         style: Styles.footnoteSemiboldBold.copyWith(
//                           color: AppColors.neutralColor600,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Icon(
//                   context.locale.languageCode == 'ar'
//                       ? Icons.keyboard_arrow_left_outlined
//                       : Icons.keyboard_arrow_right_outlined,
//                   color: AppColors.primaryColor900,
//                 )
//               ],
//             ),
//           ),
//           18.verticalSpace,
//           Text(
//             "sessionDetails".tr(),
//             style: Styles.highlightAccent,
//           ),
//           12.verticalSpace,
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
//             decoration: BoxDecoration(
//               color: AppColors.neutralColor100.withValues(alpha: 0.1),
//               borderRadius: BorderRadius.circular(10.r),
//               border: Border.all(
//                 color: AppColors.neutralColor300,
//               ),
//             ),
//             child: Row(
//               children: [
//                 CachedNetworkImage(
//                   imageUrl:
//                       "https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359554_1280.png",
//                   width: 55.sp,
//                   height: 55.sp,
//                 ),
//                 10.horizontalSpace,
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "myAddress".tr(),
//                         style: Styles.contentAccent,
//                       ),
//                       4.verticalSpace,
//                       Text(
//                         "123 Main St, Anytown, USA",
//                         style: Styles.footnoteSemiboldBold.copyWith(
//                           color: AppColors.neutralColor600,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           14.verticalSpace,
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
//             decoration: BoxDecoration(
//               color: AppColors.neutralColor100.withValues(alpha: 0.1),
//               borderRadius: BorderRadius.circular(10.r),
//               border: Border.all(
//                 color: AppColors.neutralColor300,
//               ),
//             ),
//             child: Row(
//               children: [
//                 Text(
//                   "total".tr(),
//                   style: Styles.footnoteSemiboldBold.copyWith(
//                     color: AppColors.neutralColor600,
//                   ),
//                 ),
//                 const Spacer(),
//                 Text(
//                   "\$150.00",
//                   style: Styles.contentAccent,
//                 ),
// 4.verticalSpace,
//               ],
//             ),
//           ),
// 170.verticalSpace,
//         ],
//       ),
//     );
//   }
// }

class FormWidget extends StatelessWidget {
  const FormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Item> items = [
      Item(
        imageUrl: "assets/images/png/profile_image_booking.png",
        title: "Ahmed Hossam",
        subtitle: "Specialization Here",
      ),
      Item(
        imageUrl: "assets/images/png/profile_image_booking.png",
        title: "Ahmed Hossam",
        subtitle: "Specialization Here",
      ),
      Item(
        imageUrl: "assets/images/png/profile_image_booking.png",
        title: "Ahmed Hossam",
        subtitle: "Specialization Here",
      ),
    ];

    return ListView.builder(
      itemCount: items.length,
      // padding: EdgeInsets.all(16.r),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final item = items[index];
        return Container(
          margin: EdgeInsets.only(bottom: 12.h),
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: AppColors.neutralColor100.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: AppColors.neutralColor300,
            ),
          ),
          child: Row(
            children: [
              Image.asset(
                item.imageUrl,
                width: 55.sp,
                height: 55.sp,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error),
              ),
              10.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item.title,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.neutralColor1000,
                      ),
                    ),
                    4.verticalSpace,
                    Text(
                      item.subtitle,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.neutralColor600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class Item {
  final String imageUrl;
  final String title;
  final String subtitle;

  Item({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });
}
