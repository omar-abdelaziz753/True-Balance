import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/widgets/background/custom_main_body_widget.dart';
import 'package:truee_balance_app/features/auth/presentation/widgets/create_new_password_form_widget.dart';
import 'package:truee_balance_app/features/auth/presentation/widgets/custom_header_widget.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor900,
      body: CustomMainBodyWidget(
        bodyWidget: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Center(
                      child: Column(
                        children: [
                          CustomHeaderWidget(
                            title1: 'createANew'.tr(),
                            title2: 'password'.tr(),
                            description:
                                'descriptionOfHeaderInCreate'.tr() + email,
                          ),
                          const Expanded(child: CreateNewPasswordFormWidget()),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
