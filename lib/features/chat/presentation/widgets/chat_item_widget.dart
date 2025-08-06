import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';

class ChatTextItemWidget extends StatelessWidget {
  const ChatTextItemWidget({
    super.key,
    required this.isSender,
    required this.message,
  });

  final bool isSender;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment:
          isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isSender) ...[
          Image.asset(
            "assets/images/png/profile_image.png",
            width: 32.w,
            height: 32.h,
          ),
          SizedBox(width: 8.w),
        ],
        Flexible(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: isSender
                  ? AppColors.secondaryColor500
                  : AppColors.neutralColor100,
              border: Border.all(
                color:
                    isSender ? Colors.transparent : AppColors.neutralColor200,
                width: 1.w,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(12.r),
              ),
            ),
            child: Text(
              message,
              style: Styles.captionEmphasis.copyWith(
                color: isSender
                    ? AppColors.neutralColor100
                    : AppColors.neutralColor1000,
                fontSize: 14.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
