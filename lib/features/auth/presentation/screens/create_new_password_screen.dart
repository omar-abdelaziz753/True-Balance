import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/features/auth/business_logic/auth_cubit.dart';
import 'package:truee_balance_app/features/auth/presentation/widgets/create_new_password_form_widget.dart';
import 'package:truee_balance_app/features/auth/presentation/widgets/custom_header_widget.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
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
                    title1: 'createANew'.tr(),
                    title2: 'password'.tr(),
                    description: 'descriptionOfHeaderInCreate'.tr() +
                        cubit.emailController.text,
                  ),
                ],
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0, -80.sp, 0),
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.sp),
                  child: const CreateNewPasswordFormWidget()),
            ),
          ],
        ),
      ),
    );
  }
}
