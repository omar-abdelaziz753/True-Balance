import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';

class CustomRichText extends StatelessWidget {
  final String? text1;
  final TextStyle? textStyle1;
  final VoidCallback? onTap1;

  final String? containerText;
  final TextStyle? containerTextStyle;
  final VoidCallback? onTapContainer;

  final String? text2;
  final TextStyle? textStyle2;
  final VoidCallback? onTap2;

  final String? text3;
  final TextStyle? textStyle3;
  final VoidCallback? onTap3;

  final String? text4;
  final TextStyle? textStyle4;
  final VoidCallback? onTap4;

  final Color? textColor1;
  final Color? textColorContainer;
  final Color? textColor2;
  final Color? textColor3;
  final Color? textColor4;

  final TextAlign textAlign;
  final TextOverflow textOverflow;
  final int? maxLines;

  const CustomRichText({
    super.key,
    this.text1,
    this.containerText,
    this.textColorContainer,
    this.containerTextStyle,
    this.onTapContainer,
    this.textStyle1,
    this.onTap1,
    this.text2,
    this.textStyle2,
    this.onTap2,
    this.textAlign = TextAlign.center,
    this.textOverflow = TextOverflow.clip,
    this.maxLines,
    this.textColor1,
    this.textColor2,
    this.text3,
    this.textStyle3,
    this.onTap3,
    this.textColor3,
    this.text4,
    this.textStyle4,
    this.onTap4,
    this.textColor4,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        textAlign: textAlign,
        overflow: textOverflow,
        maxLines: maxLines,
        text: TextSpan(
          children: [
            if (text1 != null)
              TextSpan(
                text: text1,
                style: textStyle1 ??
                    Styles.captionEmphasis.copyWith(
                      color: textColor1 ?? AppColors.neutralColor1000,
                    ),
                recognizer: onTap1 != null
                    ? (TapGestureRecognizer()..onTap = onTap1)
                    : null,
              ),
            if(containerText != null)
              WidgetSpan(
                alignment: PlaceholderAlignment.middle, // ✅ مهم لتوسيط الـ Container
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor500,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Text(
                    containerText!,
                    style: containerTextStyle ??
                        Styles.captionEmphasis.copyWith(
                          color: textColorContainer ?? Colors.white,
                        ),
                  ),
                ),
              ),
            if (text2 != null)
              TextSpan(
                text: text2,
                style: textStyle2 ??
                    Styles.captionEmphasis.copyWith(
                      color: textColor2 ?? AppColors.primaryColor900,
                      overflow: TextOverflow.ellipsis,
                    ),
                recognizer: onTap2 != null
                    ? (TapGestureRecognizer()..onTap = onTap2)
                    : null,
              ),
            if (text3 != null)
              TextSpan(
                text: text3,
                style: textStyle3 ??
                    Styles.captionEmphasis.copyWith(
                      color: textColor3 ?? AppColors.primaryColor900,
                      overflow: TextOverflow.ellipsis,
                    ),
                recognizer: onTap3 != null
                    ? (TapGestureRecognizer()..onTap = onTap3)
                    : null,
              ),
            if (text4 != null)
              TextSpan(
                text: text4,
                style: textStyle4 ??
                    Styles.captionEmphasis.copyWith(
                      color: textColor4 ?? AppColors.primaryColor900,
                      overflow: TextOverflow.ellipsis,
                    ),
                recognizer: onTap4 != null
                    ? (TapGestureRecognizer()..onTap = onTap4)
                    : null,
              ),
          ],
        ),
      ),
    );
  }
}
