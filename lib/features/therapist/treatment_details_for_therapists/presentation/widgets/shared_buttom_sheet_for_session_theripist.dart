import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';
import 'package:truee_balance_app/core/widgets/text_field/custom_text_form_field_widget.dart';

class CustomSharedBottomSheetReviewForSession extends StatelessWidget {
  final String title;
  final String nameOfFiled;
  final String? hintText;
  final String? buttonText1;
  final String? buttonText2;
  final double initialRating;
  final void Function(double) onRatingChanged;
  final TextEditingController commentController;
  final VoidCallback onEditPressed;
  final VoidCallback onCancelPressed;
  final VoidCallback onAttachFilePressed;
  final String fileName;
  final bool? isEdit;

  const CustomSharedBottomSheetReviewForSession({
    super.key,
    required this.title,
    required this.buttonText1,
    required this.buttonText2,
    required this.nameOfFiled,
    required this.initialRating,
    required this.onRatingChanged,
    required this.commentController,
    required this.onEditPressed,
    required this.onCancelPressed,
    required this.onAttachFilePressed,
    required this.fileName,
    this.hintText,
    this.isEdit = false,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        width: double.infinity,
        padding:
            EdgeInsets.only(left: 18.w, right: 18.w, bottom: 34.h, top: 12.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24.r),
            topLeft: Radius.circular(24.r),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                title,
                style: Styles.heading4.copyWith(
                  color: AppColors.neutralColor1000,
                ),
              ),
            ),
            12.verticalSpace,
            Divider(
              color: AppColors.neutralColor300,
              thickness: 1.w,
            ),
            24.verticalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'recoveryRate'.tr(),
                      style: Styles.highlightEmphasis.copyWith(
                        color: AppColors.neutralColor1000,
                      ),
                    ),
                    Text(
                      '${initialRating.toInt()} / 100',
                      style: Styles.highlightEmphasis.copyWith(
                        color: AppColors.primaryColor700,
                      ),
                    ),
                  ],
                ),
                Slider(
                  value: initialRating,
                  min: 1,
                  max: 100,
                  label: initialRating.toInt().toString(),
                  onChanged: onRatingChanged,
                  activeColor: AppColors.primaryColor700,
                  inactiveColor: AppColors.neutralColor300,
                ),
              ],
            ),
            24.verticalSpace,
            Text(
              nameOfFiled,
              style: Styles.highlightEmphasis.copyWith(
                color: AppColors.neutralColor1000,
              ),
            ),
            8.verticalSpace,
            CustomTextFormFieldWidget(
              controller: commentController,
              borderColor: isEdit == false
                  ? AppColors.neutralColor600
                  : AppColors.neutralColor1000,
              borderWidth: 1.w,
              hintText: hintText,
              hintStyle: isEdit == false
                  ? Styles.contentRegular
                      .copyWith(color: AppColors.neutralColor600)
                  : Styles.contentRegular
                      .copyWith(color: AppColors.neutralColor1000),
              maxLines: 6,
            ),
            16.verticalSpace,
            GestureDetector(
              onTap: onAttachFilePressed,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryColor700),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  children: [
                    Icon(Icons.attach_file, color: AppColors.primaryColor700),
                    8.horizontalSpace,
                    Expanded(
                      child: Text(
                        fileName.isEmpty ? 'attachAFile'.tr() : fileName,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.contentRegular.copyWith(
                          color: fileName.isEmpty
                              ? AppColors.neutralColor600
                              : AppColors.primaryColor700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            24.verticalSpace,
            Row(
              spacing: 18.w,
              children: [
                Expanded(
                  child: CustomButtonWidget(
                    onPressed: onEditPressed,
                    text: buttonText1,
                    fontSize: 16.sp,
                    color: AppColors.primaryColor700,
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                ),
                Expanded(
                  child: CustomButtonWidget(
                    onPressed: onCancelPressed,
                    text: buttonText2,
                    fontSize: 16.sp,
                    color: Colors.white,
                    textColor: AppColors.primaryColor700,
                    borderSide: BorderSide(
                      width: 1.w,
                      color: AppColors.primaryColor700,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
