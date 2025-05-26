import 'package:flutter/material.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/features/auth/presentation/widgets/custom_header_widget.dart';
import 'package:truee_balance_app/features/auth/presentation/widgets/forget_password_from_widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor900,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: const IntrinsicHeight(
                  child: Center(
                    child: Column(
                      children: [
                        CustomHeaderWidget(
                          title1: 'Forgot ',
                          title2: 'Password',
                          description:
                              'Please enter your email and we will send a confirmation code to your email',
                        ),
                        Expanded(child: ForgetPasswordFormWidget()),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
