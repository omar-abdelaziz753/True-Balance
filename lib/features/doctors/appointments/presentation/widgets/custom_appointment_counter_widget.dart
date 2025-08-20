import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/images/cache_network_image/image_widget.dart';

class CustomAppointmentContainerWidget extends StatelessWidget {
  final String title;
  final String phone;
  final String imagePath;
  final bool isLoading;

  const CustomAppointmentContainerWidget({
    super.key,
    required this.title,
    required this.phone,
    required this.imagePath,
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
                  : CacheNetworkImagesWidget(
                      image: imagePath,
                      width: 95.w,
                      height: 95.h,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
