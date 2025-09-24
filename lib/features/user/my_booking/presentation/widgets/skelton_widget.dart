import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/features/user/my_booking/presentation/widgets/custom_booking_container_widget.dart';

class SkeltonWidget extends StatelessWidget {
  const SkeltonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor900,
      appBar: CustomBasicAppBar(
        actions: const [
          Icon(Icons.filter_list, color: Colors.white),
        ],
        leading: Navigator.canPop(context)
            ? BackButton(
                color: AppColors.neutralColor100,
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            : null,
        title: 'myBooking'.tr(),
        backgroundColor: AppColors.primaryColor900,
        svgAsset: 'assets/images/svg/bg_image.svg',
      ),
      body: Skeletonizer(
        enabled: true,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(18.sp),
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
                  children: [
                    Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: 10,
                        separatorBuilder: (context, index) => 18.verticalSpace,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () =>
                                context.pushNamed(Routes.bookingDetailsScreen),
                            child: const CustomBookingContainerWidget(
                                date: "2024-10-10",
                                time: "4:00 pm",
                                status: "pending"),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
