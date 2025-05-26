import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/core/widgets/bottom_sheet/show_change_password_bottom_sheet.dart';
import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';
import 'package:truee_balance_app/features/user/my_booking/widgets/custom_row_make_title_and_desc_widget.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key});

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
        title: 'Booking Details',
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
                            const CustomRowMakeTitleAndDescWidget(
                              title: 'Date',
                              description: 'January 5',
                            ),
                            const CustomRowMakeTitleAndDescWidget(
                              title: 'Time',
                              description: '7:00 AM',
                            ),
                            const CustomRowMakeTitleAndDescWidget(
                              title: 'Check in',
                              description: 'December 23, 2022',
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
                            const CustomRowMakeTitleAndDescWidget(
                              title: 'Name',
                              description: 'Omar AbdelAziz',
                            ),
                            const CustomRowMakeTitleAndDescWidget(
                              title: 'Phone Number',
                              description: '+201 027 324 902',
                            ),
                            const CustomRowMakeTitleAndDescWidget(
                              title: 'Therapists Name',
                              description: 'Ahmed Hossam',
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
                            const CustomRowMakeTitleAndDescWidget(
                              title: 'Total',
                              description: '\$150.00',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Positioned(
            left: 18.w,
            right: 18.w,
            bottom: 32.h,
            child: CustomButtonWidget(
              padding: EdgeInsets.symmetric(vertical: 14.h),
              text: 'Tips for better experience',
              textStyle: Styles.captionEmphasis.copyWith(
                color: AppColors.neutralColor100,
              ),
              onPressed: () {
                showChangePasswordBottomSheet(context,
                    title1: "our Ticket ",
                    title2: "Successfully",
                    description:
                        "Your ticket is now under review by our support team.",
                    buttonText: " Ok", onPressed: () {
                  Navigator.pop(context);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
