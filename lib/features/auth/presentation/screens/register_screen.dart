import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/utils/easy_loading.dart';
import 'package:truee_balance_app/features/auth/presentation/widgets/custom_header_widget.dart';
import 'package:truee_balance_app/features/auth/presentation/widgets/register_form_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    hideLoading();
    return Scaffold(
      backgroundColor: const Color(0xffF6F8FA),
      // backgroundColor: Colors.red,
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
                    title1: 'welcomeTo'.tr(),
                    title2: 'trueBalance'.tr(),
                    description: 'descriptionOfHeaderInRegister'.tr(),
                  ),
                ],
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0, -80.sp, 0),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.sp),
                child: const ResisterFormWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
