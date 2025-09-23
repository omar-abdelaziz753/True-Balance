import 'package:flutter/material.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';

class LoadingWidget extends StatelessWidget {
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