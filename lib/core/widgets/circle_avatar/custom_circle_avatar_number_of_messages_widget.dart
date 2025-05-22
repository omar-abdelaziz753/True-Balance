import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';

class CustomCircleAvatarNumberOfMessagesWidget extends StatelessWidget {
  const CustomCircleAvatarNumberOfMessagesWidget({
    super.key, required this.numberOfMessages,
  });

  final String numberOfMessages;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 9.r,
      backgroundColor: AppColors.secondaryColor500,
      child: Center(
        child: Text(
          numberOfMessages,
          style: Styles.footnoteRegular.copyWith(
            color: AppColors.neutralColor100,
            fontSize: 10.sp,
          ),
        ),
      ),
    );
  }
}
