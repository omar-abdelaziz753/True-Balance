import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/cache_helper/cache_helper.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final TextStyle? labelStyle;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final bool? obscureText;
  final bool? autofocus;
  final bool? autocorrect;
  final bool? enableSuggestions;
  final bool? readOnly;
  final bool? showCursor;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final bool isChat;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final FormFieldSetter<String>? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? enabled;
  final Iterable<String>? autofillHints;
  final EdgeInsets? contentPadding;
  final EdgeInsets? padding;
  final bool? expands;
  final int? maxLines;
  final int? minLines;
  final ValueChanged<String>? onFieldSubmitted;
  final List<TextInputFormatter>? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final VoidCallback? onTap;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final double? height;
  final double? width;
  final TextAlignVertical? textAlignVertical;
  final FocusNode? focusNode;

  const CustomTextFormFieldWidget({
    super.key,
    this.controller,
    this.isChat = false,
    this.padding,
    this.textStyle,
    this.hintStyle,
    this.hintText,
    this.width,
    this.labelText,
    this.labelStyle,
    this.backgroundColor,
    this.helperText,
    this.borderColor,
    this.borderWidth,
    this.errorText,
    this.obscureText = false,
    this.autofocus = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.readOnly = false,
    this.showCursor,
    this.maxLength,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.validator,
    this.borderRadius,
    this.onSaved,
    this.inputFormatters,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled,
    this.autofillHints,
    this.contentPadding,
    this.expands,
    this.maxLines,
    this.minLines,
    this.onFieldSubmitted,
    this.buildCounter,
    this.scrollPhysics,
    this.onTap,
    this.height,
    this.textAlignVertical,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: focusNode,
      child: Builder(
        builder: (context) {
          final bool isFocused = Focus.of(context).hasFocus;

          final Color currentBorderColor = isFocused
              ? AppColors.primaryColor900
              : borderColor ?? AppColors.neutralColor600;

          final TextStyle currentHintStyle =
              (hintStyle ?? Styles.captionRegular).copyWith(
            color: isFocused
                ? AppColors.primaryColor900
                : AppColors.neutralColor600,
          );

          return Directionality(
            textDirection: TextDirection.ltr,
            child: TextFormField(
              cursorColor: AppColors.primaryColor900,
              focusNode: focusNode,
              controller: controller,
              obscureText: obscureText ?? false,
              textAlign: CacheHelper.getCurrentLanguage() == "ar"
                  ? TextAlign.end
                  : TextAlign.start,
              autofocus: autofocus ?? false,
              autocorrect: autocorrect ?? true,
              enableSuggestions: enableSuggestions ?? true,
              readOnly: readOnly ?? false,
              showCursor: showCursor,
              maxLength: maxLength,
              keyboardType: keyboardType,
              textInputAction: textInputAction,
              onChanged: onChanged,
              validator: validator,
              onSaved: onSaved,
              inputFormatters: inputFormatters,
              textAlignVertical: textAlignVertical,
              onFieldSubmitted: onFieldSubmitted,
              scrollPhysics: scrollPhysics,
              onTap: onTap,
              autofillHints: autofillHints,
              maxLines: isChat ? null : maxLines ?? 1,
              minLines: isChat ? null : minLines,
              style: textStyle ??
                  Styles.contentEmphasis.copyWith(
                    color: AppColors.neutralColor1000,
                  ),
              onTapOutside:
                  isChat ? null : (event) => FocusScope.of(context).unfocus(),
              decoration: InputDecoration(
                alignLabelWithHint: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      borderRadius ?? AppConstants.borderRadius),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      borderRadius ?? AppConstants.borderRadius),
                  borderSide: BorderSide(
                    color: currentBorderColor,
                    width: borderWidth ?? 1.sp,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      borderRadius ?? AppConstants.borderRadius),
                  borderSide: BorderSide(
                    color: currentBorderColor,
                    width: borderWidth ?? 1.sp,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      borderRadius ?? AppConstants.borderRadius),
                  borderSide: BorderSide(
                    color: AppColors.redColor100,
                    width: borderWidth ?? 1.sp,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      borderRadius ?? AppConstants.borderRadius),
                  borderSide: BorderSide(
                    color: AppColors.redColor100,
                    width: borderWidth ?? 1.sp,
                  ),
                ),
                labelText: labelText,
                labelStyle: labelStyle ??
                    Styles.contentEmphasis.copyWith(
                      color: AppColors.neutralColor300,
                    ),
                hintText: hintText,
                hintStyle: currentHintStyle,
                helperText: helperText,
                errorText: errorText,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                filled: true,
                fillColor: backgroundColor ?? AppColors.neutralColor100,
                prefixIconColor: AppColors.neutralColor1000,
                suffixIconColor: AppColors.neutralColor1000,
                enabled: enabled ?? true,
                contentPadding: contentPadding ??
                    EdgeInsets.symmetric(
                      horizontal: width ?? 15.w,
                      vertical: height ?? 15.h,
                    ),
              ),
            ),
          );
        },
      ),
    );
  }
}
