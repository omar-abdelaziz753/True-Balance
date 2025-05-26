import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';

class CustomMainAppBarWidget extends StatelessWidget {
  final String userName;
  final String userImage;
  final String greetingText;
  final String? profilePic;
  final bool haveProfilePic;
  final Widget? actionIconsWidget;

  const CustomMainAppBarWidget({
    super.key,
    required this.userName,
    required this.userImage,
    required this.greetingText,
    this.profilePic,
    this.haveProfilePic = false,
    this.actionIconsWidget,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(8.r),
        bottomRight: Radius.circular(8.r),
      ),
      child: Container(
        padding: EdgeInsets.only(
          top: 20.h,
          left: 18.w,
          right: 18.w,
          bottom: Platform.isAndroid ? 25.h : 20.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.primaryColor700,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8.r),
            bottomRight: Radius.circular(8.r),
          ),
        ),
        child: SafeArea(
          child: Row(
            children: [
              CircleAvatar(
                radius: 26.r,
                backgroundImage:
                    AppConstants.getProfileImage(profilePic, userImage),
              ),
              SizedBox(width: 12.w),
              SizedBox(
                width: AppConstants.screenWidth(context) / 1.8,
                child: Column(
                  spacing: 6.h,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      greetingText,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.neutralColor300,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      userName,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.neutralColor100,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              actionIconsWidget ?? const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
