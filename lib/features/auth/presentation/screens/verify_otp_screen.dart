import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/features/auth/presentation/widgets/custom_header_widget.dart';
import 'package:truee_balance_app/features/auth/presentation/widgets/verify_otp_form_widget.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key, required this.data});

  // final String emailAddress;
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F8FA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: AppColors.primaryColor900,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/png/back_g.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  CustomHeaderWidget(
                    title1: 'enterVerification'.tr(),
                    title2: 'code'.tr(),
                    description:
                        '${'descriptionOfHeaderInVerify'.tr()}${data['email']}',
                    isEdit: true,
                    onEditTap: () {},
                  ),
                ],
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0, -80.sp, 0),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.sp),
                child: VerifyOtpWidgetWidget(
                  data: {
                    'screenName': data['screenName'],
                    'email': data['email'],
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
