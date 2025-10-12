import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/features/auth/presentation/widgets/custom_header_widget.dart';
import 'package:truee_balance_app/features/auth/presentation/widgets/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                    title1: 'signIn'.tr(),
                    title2: 'account'.tr(),
                    description: 'descriptionOfHeaderInLogin'.tr(),
                  ),
                ],
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0, -90.sp, 0),
              // color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 18.sp, vertical: 10..sp),
                    child: const LoginFormWidget(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
