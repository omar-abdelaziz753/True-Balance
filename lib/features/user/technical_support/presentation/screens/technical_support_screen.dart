import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';
import 'package:truee_balance_app/core/widgets/container/custom_divider_widget.dart';
import 'package:truee_balance_app/features/user/setting/presentation/widgets/custom_row_in_technnical_support_widget.dart';
import 'package:truee_balance_app/features/user/technical_support/bloc/technical_support_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class TechnicalSupportScreen extends StatelessWidget {
  const TechnicalSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TechnicalSupportCubit>();
    return BlocBuilder<TechnicalSupportCubit, TechnicalSupportState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor900,
          appBar: CustomBasicAppBar(
            leading: BackButton(
              color: AppColors.neutralColor100,
              onPressed: () {
                context.pop();
              },
            ),
            title: 'technicalSupport'.tr(),
            backgroundColor: AppColors.primaryColor900,
            svgAsset: 'assets/images/svg/bg_image.svg',
          ),
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.all(18.sp),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  topRight: Radius.circular(12.r),
                ),
              ),
              child: LayoutBuilder(builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: constraints.maxWidth,
                      minHeight: constraints.maxHeight,
                    ),
                    child: state is GetAboutUsLoadingState
                        ? Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor900,
                            ),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'howCanWeHelpYou'.tr(),
                                style: Styles.highlightEmphasis.copyWith(
                                  color: AppColors.neutralColor1000,
                                ),
                              ),
                              18.verticalSpace,
                              CustomButtonWidget(
                                width: 180.w,
                                padding: EdgeInsets.symmetric(vertical: 12.h),
                                color: AppColors.primaryColor900.withAlpha(20),
                                text: 'myTickets'.tr(),
                                textStyle: Styles.captionEmphasis.copyWith(
                                  color: AppColors.primaryColor900,
                                ),
                                imagePath:
                                    'assets/images/svg/my_tickets_icon_in_button.svg',
                                imageColor: AppColors.primaryColor900,
                                onPressed: () =>
                                    context.pushNamed(Routes.myTicketsScreen),
                              ),
                              // Container(
                              //   padding: EdgeInsets.only(
                              //     top: 18.w,
                              //     bottom: 18.w,
                              //   ),
                              //   child: Column(
                              //     spacing: 16.h,
                              //     children: [
                              //       CustomRowInTechnicalSupportWidget(
                              //         title: 'aboutUs'.tr(),
                              //         onTap: () => context
                              //             .pushNamed(Routes.aboutUsScreen , arguments: ),
                              //       ),
                              //       const CustomDividerWidget(),
                              //       CustomRowInTechnicalSupportWidget(
                              //         title: 'termsAndConditions'.tr(),
                              //         onTap: () => context
                              //             .pushNamed(Routes.aboutUsScreen),
                              //       ),
                              //       const CustomDividerWidget(),
                              //       CustomRowInTechnicalSupportWidget(
                              //         title: 'privacyPolicy'.tr(),
                              //         onTap: () => context
                              //             .pushNamed(Routes.aboutUsScreen),
                              //       ),
                              //       const CustomDividerWidget(),

                              //     ],
                              //   ),
                              // ),
                              ListView.separated(
                                padding: EdgeInsets.only(
                                  top: 18.w,
                                  bottom: 18.w,
                                ),
                                itemCount: cubit.aboutUsModel!.data!.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      10.verticalSpace,
                                      const CustomDividerWidget(),
                                      10.verticalSpace,
                                    ],
                                  );
                                },
                                itemBuilder: (BuildContext context, int index) {
                                  return CustomRowInTechnicalSupportWidget(
                                    title:
                                        cubit.aboutUsModel!.data![index].title!,
                                    onTap: () => context.pushNamed(
                                        Routes.aboutUsScreen,
                                        arguments:
                                            cubit.aboutUsModel!.data![index]),
                                  );
                                },
                              ),
                              const CustomDividerWidget(),
                              10.verticalSpace,
                              CustomRowInTechnicalSupportWidget(
                                title: 'visitOurWebsite'.tr(),
                                onTap: () async {
                                  await launchUrl(
                                      Uri.parse(
                                          'https://truebalance.tanfeethi.tanfeethi.com.sa/'),
                                      mode: LaunchMode.externalApplication);
                                },
                              ),
                            ],
                          ),
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
