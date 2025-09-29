import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';

class CustomTextFormFieldWidget extends StatefulWidget {
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
  State<CustomTextFormFieldWidget> createState() =>
      _CustomTextFormFieldWidgetState();
}

class _CustomTextFormFieldWidgetState extends State<CustomTextFormFieldWidget> {
  late FocusNode _internalFocusNode;
  bool _isFocused = false;

  FocusNode get _focusNode => widget.focusNode ?? _internalFocusNode;

  @override
  void initState() {
    super.initState();
    _internalFocusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    if (mounted) {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    }
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _internalFocusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color currentBorderColor = _isFocused
        ? AppColors.primaryColor900
        : widget.borderColor ?? AppColors.neutralColor600;

    final TextStyle currentHintStyle =
        (widget.hintStyle ?? Styles.captionRegular).copyWith(
      color: _isFocused ? AppColors.primaryColor900 : AppColors.neutralColor600,
    );

    return Directionality(
      textDirection: TextDirection.ltr,
      child: TextFormField(
        cursorColor: AppColors.primaryColor900,
        focusNode: _focusNode,
        controller: widget.controller,
        obscureText: widget.obscureText ?? false,
        autofocus: widget.autofocus ?? false,
        autocorrect: widget.autocorrect ?? true,
        enableSuggestions: widget.enableSuggestions ?? true,
        readOnly: widget.readOnly ?? false,
        showCursor: widget.showCursor,
        maxLength: widget.maxLength,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        onChanged: widget.onChanged,
        validator: widget.validator,
        onSaved: widget.onSaved,
        inputFormatters: widget.inputFormatters,
        textAlignVertical: widget.textAlignVertical,
        onFieldSubmitted: widget.onFieldSubmitted,
        scrollPhysics: widget.scrollPhysics,
        onTap: widget.onTap,
        autofillHints: widget.autofillHints,
        maxLines: widget.isChat ? null : widget.maxLines ?? 1,
        minLines: widget.isChat ? null : widget.minLines,
        style: widget.textStyle ??
            Styles.contentEmphasis.copyWith(
              color: AppColors.neutralColor1000,
            ),
        onTapOutside:
            widget.isChat ? null : (event) => FocusScope.of(context).unfocus(),
        decoration: InputDecoration(
          alignLabelWithHint: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                widget.borderRadius ?? AppConstants.borderRadius),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                widget.borderRadius ?? AppConstants.borderRadius),
            borderSide: BorderSide(
              color: currentBorderColor,
              width: widget.borderWidth ?? 1.sp,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                widget.borderRadius ?? AppConstants.borderRadius),
            borderSide: BorderSide(
              color: currentBorderColor,
              width: widget.borderWidth ?? 1.sp,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                widget.borderRadius ?? AppConstants.borderRadius),
            borderSide: BorderSide(
              color: AppColors.redColor100,
              width: widget.borderWidth ?? 1.sp,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                widget.borderRadius ?? AppConstants.borderRadius),
            borderSide: BorderSide(
              color: AppColors.redColor100,
              width: widget.borderWidth ?? 1.sp,
            ),
          ),
          labelText: widget.labelText,
          labelStyle: widget.labelStyle ??
              Styles.contentEmphasis.copyWith(
                color: AppColors.neutralColor300,
              ),
          hintText: widget.hintText,
          hintStyle: currentHintStyle,
          helperText: widget.helperText,
          errorText: widget.errorText,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          filled: true,
          fillColor: widget.backgroundColor ?? AppColors.neutralColor100,
          prefixIconColor: AppColors.neutralColor1000,
          suffixIconColor: AppColors.neutralColor1000,
          enabled: widget.enabled ?? true,
          contentPadding: widget.contentPadding ??
              EdgeInsets.symmetric(
                horizontal: widget.width ?? 15.w,
                vertical: widget.height ?? 15.h,
              ),
        ),
      ),
    );
  }
}
