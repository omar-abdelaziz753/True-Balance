import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/features/user/technical_support/data/models/about_us/about_us_model.dart';
import 'package:truee_balance_app/features/user/technical_support/presentation/widgets/custom_section_in_about_us_widget.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key, required this.data});
  final AboutUsData data;
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
        title: data.title ??"",
        backgroundColor: AppColors.primaryColor900,
        svgAsset: 'assets/images/svg/bg_image.svg',
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(18.sp),
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
              child: CustomSectionInAboutUsWidget(
                description:
                    data.text!.replaceAll(RegExp(r'<[^>]*>'), '') ?? '',
              ),
            );
          },
        ),
      ),
    );

    // );
  }
}
