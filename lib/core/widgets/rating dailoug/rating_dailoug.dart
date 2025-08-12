import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';
import 'package:truee_balance_app/core/widgets/text_field/custom_text_form_field_widget.dart';

class CustomSharedBottomSheetReview extends StatelessWidget {
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
  final bool? isEdit;

  const CustomSharedBottomSheetReview({
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
    this.hintText,
    this.isEdit = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            // CustomDividerInBottomSheet(),
            Divider(
              color: AppColors.neutralColor300,
              thickness: 1.w,
            ),
            24.verticalSpace,

            /// Rating
            RatingBar.builder(
              initialRating: initialRating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 60.sp,
              itemPadding: EdgeInsets.symmetric(horizontal: 5.w),
              itemBuilder: (context, _) => Center(
                child: Icon(
                  Icons.star,
                  color: AppColors.yellowColor100,
                  size: 60.sp,
                ),
              ),
              unratedColor: AppColors.neutralColor300,
              glowColor: AppColors.neutralColor300,
              onRatingUpdate: onRatingChanged,
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
              borderColor: isEdit == false ? AppColors.neutralColor600 : AppColors.neutralColor1000,
              borderWidth: 1.w,
              hintText: hintText,
              hintStyle: isEdit == false
                  ? Styles.contentRegular.copyWith(
                color: AppColors.neutralColor600,
              )
                  : Styles.contentRegular.copyWith(
                color: AppColors.neutralColor1000,
              ),
              maxLines: 6,
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