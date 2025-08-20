import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';

class SessinonsAndBookingScreen extends StatelessWidget {
  const SessinonsAndBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: AppColors.primaryColor900,
          appBar: CustomBasicAppBar(
            title: " Booking & Sessions".tr(),
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
              children: [
                // Container(
                //   width: double.infinity,
                //   padding: EdgeInsets.all(12.sp),
                //   decoration: BoxDecoration(
                //     color: AppColors.neutralColor100,
                //     borderRadius: BorderRadius.circular(12.r),
                //     border: Border.all(
                //       color: AppColors.neutralColor1000.withAlpha(20),
                //       width: 1.w,
                //     ),
                //     boxShadow: [
                //       BoxShadow(
                //         offset: Offset(0, 2.h),
                //         blurRadius: 8.r,
                //         spreadRadius: 0,
                //         color: Colors.black.withAlpha(20),
                //       ),
                //     ],
                //   ),
                // ),
                // 18.verticalSpace,
                TabBar(
                  unselectedLabelColor: AppColors.neutralColor600,
                  labelColor: AppColors.primaryColor800,
                  indicatorColor: AppColors.primaryColor800,
                  dividerColor: AppColors.neutralColor300,
                  automaticIndicatorColorAdjustment: true,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(text: 'myBooking'.tr()),
                    Tab(text: 'mySessions'.tr()),
                  ],
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      Center(child: Text("Booking Screen")),
                      Center(child: Text("Sessions Screen")),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
// class MyBookingScreen extends StatelessWidget {
//   const MyBookingScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     final cubit = context.read<MybookCubit>();
//     return BlocBuilder<MybookCubit, MybookState>(
//       buildWhen: (previous, current) =>
//           current is ConsultationsSuccess ||
//           current is ConsultationsLoading ||
//           current is ConsultationsError,
//       builder: (context, state) {
//         if (state is ConsultationsLoading) {
//           return Scaffold(
//             backgroundColor: AppColors.primaryColor900,
//             appBar: CustomBasicAppBar(
//               leading: BackButton(
//                 color: AppColors.neutralColor100,
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               ),
//               title: 'myBooking'.tr(),
//               backgroundColor: AppColors.primaryColor900,
//               svgAsset: 'assets/images/svg/bg_image.svg',
//             ),
//             body: Skeletonizer(
//               enabled: true,
//               child: Container(
//                 width: double.infinity,
//                 padding: EdgeInsets.all(18.sp),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(12.r),
//                     topRight: Radius.circular(12.r),
//                   ),
//                 ),
//                 child: LayoutBuilder(
//                   builder: (context, constraints) {
//                     return ConstrainedBox(
//                       constraints: BoxConstraints(
//                         minHeight: constraints.maxHeight,
//                       ),
//                       child: Column(
//                         children: [
//                           Expanded(
//                             child: ListView.separated(
//                               shrinkWrap: true,
//                               itemCount: 10,
//                               separatorBuilder: (context, index) =>
//                                   18.verticalSpace,
//                               itemBuilder: (context, index) {
//                                 return GestureDetector(
//                                   onTap: () => context
//                                       .pushNamed(Routes.bookingDetailsScreen),
//                                   child: CustomBookingContainerWidget(
//                                     specialization: 'specialization'.tr(),
//                                     doctorName: 'Ahmed Adel',
//                                     rating: 4.8,
//                                     ratingText: '4,479 ${'rate'.tr()}',
//                                     image: Placeholder(
//                                       fallbackHeight: 95.h,
//                                       fallbackWidth: 95.w,
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           );
//         }
//         return Scaffold(
//           backgroundColor: AppColors.primaryColor900,
//           appBar: CustomBasicAppBar(
//             leading: BackButton(
//               color: AppColors.neutralColor100,
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//             title: 'myBooking'.tr(),
//             backgroundColor: AppColors.primaryColor900,
//             svgAsset: 'assets/images/svg/bg_image.svg',
//           ),
//           body: Container(
//             width: double.infinity,
//             padding: EdgeInsets.all(18.sp),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(12.r),
//                 topRight: Radius.circular(12.r),
//               ),
//             ),
//             child: LayoutBuilder(
//               builder: (context, constraints) {
//                 return ConstrainedBox(
//                   constraints: BoxConstraints(
//                     minHeight: constraints.maxHeight,
//                   ),
//                   child: Column(
//                     children: [
//                       Expanded(
//                         child: ListView.separated(
//                           controller: cubit.consultationsScrollController,
//                           shrinkWrap: true,
//                           itemCount:
//                               cubit.consultationsResponse!.data.data.length,
//                           separatorBuilder: (context, index) =>
//                               18.verticalSpace,
//                           itemBuilder: (context, index) {
//                             return GestureDetector(
//                               onTap: () => context.pushNamed(
//                                   Routes.bookingDetailsScreen,
//                                   arguments: cubit
//                                       .consultationsResponse!.data.data[index]),
//                               child: CustomBookingContainerWidget(
//                                 specialization: cubit.consultationsResponse!
//                                     .data.data[index].doctor.specialization,
//                                 doctorName: cubit.consultationsResponse!.data
//                                     .data[index].doctor.name,
//                                 rating: cubit.consultationsResponse!.data
//                                         .data[index].doctor.rate
//                                         .toDouble() ??
//                                     0.0,
//                                 ratingText:
//                                     '${cubit.consultationsResponse!.data.data[index].doctor.rateCount} ${'rate'.tr()}',
//                                 image: ClipRRect(
//                                   borderRadius: BorderRadius.circular(12.r),
//                                   child: CacheNetworkImagesWidget(
//                                     image: cubit.consultationsResponse!.data
//                                         .data[index].doctor.image,
//                                     width: 95.w,
//                                     height: 95.h,
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       BlocBuilder<MybookCubit, MybookState>(
//                         buildWhen: (previous, current) =>
//                             current is ConsultationsLoadingMore ||
//                             current is ConsultationsSuccess,
//                         builder: (context, state) {
//                           if (state is ConsultationsLoadingMore) {
//                             return const Center(
//                               child: CircularProgressIndicator(),
//                             );
//                           }
//                           return const SizedBox.shrink();
//                         },
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
