import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/core/widgets/scroll_bar/custom_scroll_able_content_widget.dart';
import 'package:truee_balance_app/features/user/technical_support/presentation/widgets/custom_section_in_about_us_widget.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return Scaffold(
      backgroundColor: AppColors.primaryColor900,
      appBar: CustomBasicAppBar(
        leading: BackButton(
          color: AppColors.neutralColor100,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: 'Privacy Policy',
        backgroundColor: AppColors.primaryColor900,
        svgAsset: 'assets/images/svg/bg_image.svg',
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(18.sp), // Keep this for container padding
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/images/svg/app_logo2_icon.svg',
                    height: 50.h,
                  ),
                  SizedBox(height: 20.h),
                  Expanded(
                    child: CustomScrollAbleContentWidget(
                      scrollController: scrollController,
                      contentWidget: const Column(
                        children: [
                          CustomSectionInAboutUsWidget(
                            number: '1',
                            title: 'About Us',
                            description:
                                "I'm having trouble logging in to my account. I'm getting an error message stating that the information is incorrect, even though I've verified it. Please help as soon as possible.",
                          ),
                          CustomSectionInAboutUsWidget(
                            number: '2',
                            title: 'Our Mission',
                            description:
                                "Our mission is to provide a seamless financial experience, ensuring accessibility and transparency for all our users.",
                          ),
                          CustomSectionInAboutUsWidget(
                            number: '3',
                            title: 'Contact Information',
                            description:
                                "For further support, contact us at support@truebalance.com or call +1 800 123 4567.",
                          ),
                          CustomSectionInAboutUsWidget(
                            number: '4',
                            title: 'About Us',
                            description:
                                "I'm having trouble logging in to my account. I'm getting an error message stating that the information is incorrect, even though I've verified it. Please help as soon as possible.",
                          ),
                          CustomSectionInAboutUsWidget(
                            number: '5',
                            title: 'Our Mission',
                            description:
                                "Our mission is to provide a seamless financial experience, ensuring accessibility and transparency for all our users.",
                          ),
                          CustomSectionInAboutUsWidget(
                            number: '6',
                            title: 'Contact Information',
                            description:
                                "For further support, contact us at support@truebalance.com or call +1 800 123 4567.",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
