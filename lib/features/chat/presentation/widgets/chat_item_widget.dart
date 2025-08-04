import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';

class ChatTextItemWidget extends StatelessWidget {
  const ChatTextItemWidget(
      {super.key, required this.isSender, required this.message});

  final bool isSender;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        mainAxisAlignment:
            isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isSender) ...[
            Image.asset(
              "assets/images/png/profile_image.png",
              width: 40.w,  
              height: 40.h,
            ),
            SizedBox(width: 8.w),
          ],
          Expanded(
            child: SelectableText(
              message,
              style: Styles.contentEmphasis.copyWith(
                color: Colors.black,
              ),
              textAlign: isSender ? TextAlign.right : TextAlign.left,
              // textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
            ),
          ),
          if (isSender) ...[
            SizedBox(width: 8.w),
            CircleAvatar(
              radius: 20.r,
              backgroundColor: AppColors.neutralColor100,
              child: Image.asset(
                "assets/images/png/sports.png",
                fit: BoxFit.scaleDown,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
