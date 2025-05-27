import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/core/widgets/bottom_sheet/show_change_password_bottom_sheet.dart';
import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';
import 'package:truee_balance_app/core/widgets/drop_down/custom_drop_down_widget.dart';
import 'package:truee_balance_app/core/widgets/text_field/custom_text_form_field_widget.dart';

class OpenANewTicketScreen extends StatelessWidget {
  const OpenANewTicketScreen({super.key});

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
        title: 'openANewTicket'.tr(),
        backgroundColor: AppColors.primaryColor900,
        svgAsset: 'assets/images/svg/bg_image.svg',
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(18.sp), // Keep this for container padding
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r),
              ),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'messageStatus'.tr(),
                        style: Styles.contentEmphasis.copyWith(
                          color: AppColors.neutralColor1000,
                        ),
                      ),
                      8.verticalSpace,

                      CustomDropdownButtonWidget(
                        hint: 'selectYourMessageStatus'.tr(),
                        getItemText: (p0) {
                          return p0;
                        },
                        items: [
                          'normal'.tr(),
                          'urgent'.tr(),
                        ],
                      ),
                      18.verticalSpace,

                      Text(
                        'messageDetails'.tr(),
                        style: Styles.contentEmphasis.copyWith(
                          color: AppColors.neutralColor1000,
                        ),
                      ),
                      8.verticalSpace,

                      CustomTextFormFieldWidget(
                        maxLines: 8,
                        hintText: 'enterYourMessageDetails'.tr(),
                        hintStyle: Styles.captionRegular.copyWith(
                          color: AppColors.neutralColor600,
                        ),
                      ),

                    ],
                  ),
                );
              },
            ),
          ),

          Positioned(
            left: 18.w,
            right: 18.w,
            bottom: 32.h,
            child: CustomButtonWidget(
              padding: EdgeInsets.symmetric(vertical: 14.h),
              text: 'send'.tr(),
              textStyle: Styles.captionEmphasis.copyWith(
                color: AppColors.neutralColor100,
              ),
              onPressed: () {
                showChangePasswordBottomSheet(
                    context,
                    title1: "ourTicket".tr(),
                    title2: "successfully".tr(),
                    description: "yourTicketIsNow".tr(),
                    buttonText: "ok".tr(),
                    onPressed: () {
                      Navigator.pop(context);
                    }
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
