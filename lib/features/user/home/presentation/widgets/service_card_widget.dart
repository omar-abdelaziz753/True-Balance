import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/hex_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';

class ServiceCardWidget extends StatelessWidget {
  const ServiceCardWidget({
    super.key,
    required this.title,
    required this.image,
  });

  final String? title;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(
        color: AppColors.neutralColor100,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        border: Border.all(
          width: 1.w,
          color: const Color(0xFF030303).withValues(alpha: 0.1),
        ),
        boxShadow: [
          BoxShadow(
            color: hexToColor('#0062FF').withAlpha(5),
            blurRadius: 50.r,
            spreadRadius: 0,
            offset: Offset(10.w, 10.h),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: CachedNetworkImage(
             
                imageUrl: image?.isNotEmpty == true
                    ? image!
                    : 'assets/images/png/placeholder.png',
                errorWidget: (context, url, error) => Icon(
                  Icons.error,
                  size: 44.sp,
                ),
              ),
            ),
          ),
          8.verticalSpace,
          Text(
            title ?? '---',
            style: Styles.captionRegular.copyWith(
              color: AppColors.neutralColor1000,
            ),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
