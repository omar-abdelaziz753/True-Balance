import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/core/widgets/text_field/custom_text_form_field_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor900,
      appBar: CustomBasicAppBar(
        leading: BackButton(
          color: AppColors.neutralColor100,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: 'accountInformation'.tr(),
        backgroundColor: AppColors.primaryColor900,
        svgAsset: 'assets/images/svg/bg_image.svg',
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(18.sp), // Keep this for container padding
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
          ),
        ),
        child: Column(
          children: [
            18.verticalSpace,
            Stack(
              children: [
                CircleAvatar(
                  radius: 45.r,
                  backgroundColor: AppColors.neutralColor200,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 12.r,
                    backgroundColor: AppColors.primaryColor900,
                    child: SvgPicture.asset(
                      'assets/images/svg/canera_icon.svg',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ],
            ),
            10.verticalSpace,
            Text(
              'Ahmed Hossam',
              style: Styles.highlightEmphasis.copyWith(
                color: AppColors.neutralColor1000,
              ),
            ),
            18.verticalSpace,
            Row(
              children: [
                Text(
                  'fullName'.tr(),
                  style: Styles.contentEmphasis.copyWith(
                    color: AppColors.neutralColor1000,
                  ),
                ),
              ],
            ),
            8.verticalSpace,
            CustomTextFormFieldWidget(
              hintText: 'Ahmed Hossam',
              borderColor: AppColors.neutralColor1000,
              hintStyle: Styles.captionRegular.copyWith(
                color: AppColors.neutralColor1000,
              ),
              textStyle: Styles.captionRegular.copyWith(
                color: AppColors.neutralColor1000,
              ),
              validator: (value) {
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
