import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
                child: IntrinsicHeight(
                  child: Center(
                    child: Column(
                      children: [
                        CustomHeaderWidget(
                          title1: 'enterVerification'.tr(),
                          title2: 'code'.tr(),
                          description:
                              '${'descriptionOfHeaderInVerify'.tr()}${data['email']}',
                          isEdit: true,
                          onEditTap: () {},
                        ),
                        Expanded(
                          child: VerifyOtpWidgetWidget(
                            data: {
                              'screenName': data['screenName'],
                              'email': data['email'],
                            },
                          ),
                        ),
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
