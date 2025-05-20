import 'package:flutter/material.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  /// TODO: mAKE Variable to make Check on is make call or not
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: AppColors.primaryColor900,
        ),
      ),
    );
  }
}