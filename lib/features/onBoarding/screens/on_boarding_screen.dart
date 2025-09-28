import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:truee_balance_app/core/cache_helper/cache_helper.dart';
import 'package:truee_balance_app/core/cache_helper/cache_keys.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';
import 'package:truee_balance_app/features/onBoarding/Bloc/on_boarding_cubit.dart';

import '../Bloc/on_boarding_states.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with SingleTickerProviderStateMixin {
  late OnBoardingCubit onBoardingCubit;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    onBoardingCubit = BlocProvider.of<OnBoardingCubit>(context);

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _animateToPage(int index) async {
    await onBoardingCubit.pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );

    _animationController.reverse().then((_) {
      onBoardingCubit.changeOnBoardingIndex(index);
      _animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingStates>(
      builder: (context, state) {
        return PopScope(
          canPop: false,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(140.h),
              child: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                title:
                    SvgPicture.asset("assets/images/svg/icon_onboarding.svg"),
                actions: [
                  TextButton(
                    onPressed: () {
                      CacheHelper.saveData(
                          key: CacheKeys.isFirstOpen, value: true);
                      context.pushNamedAndRemoveUntil(Routes.mainLayoutScreen);
                    },
                    child: Text(
                      'skip'.tr(),
                      style: Styles.contentEmphasis.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryColor900,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primaryColor900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: PageView.builder(
              itemCount: onBoardingCubit.onBoardingImageUrls.length,
              controller: onBoardingCubit.pageController,
              onPageChanged: (index) {
                _animationController.reverse().then((_) {
                  onBoardingCubit.changeOnBoardingIndex(index);
                  _animationController.forward();
                });
              },
              itemBuilder: (context, index) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0.sp),
                        child: AnimatedBuilder(
                          animation: _fadeAnimation,
                          builder: (context, child) {
                            return Opacity(
                              opacity: _fadeAnimation.value,
                              child: child,
                            );
                          },
                          child: Image.asset(
                            onBoardingCubit.onBoardingImageUrls[
                                onBoardingCubit.onBoardingIndex],
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0.h,
                      left: 0.w,
                      right: 0.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.sp, horizontal: 16.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.sp),
                            topRight: Radius.circular(10.sp),
                          ),
                          color: Colors.white,
                          border: Border.all(color: Colors.transparent),
                        ),
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: SlideTransition(
                            position: _slideAnimation,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: Styles.captionBold.copyWith(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: onBoardingCubit
                                                .onBoardingTitleStart[
                                            onBoardingCubit.onBoardingIndex],
                                      ),
                                      const TextSpan(text: ' '),
                                      WidgetSpan(
                                        alignment: PlaceholderAlignment.middle,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 6.w,
                                            vertical: 4.h,
                                          ),
                                          decoration: BoxDecoration(
                                            color: AppColors.secondaryColor500,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: Text(
                                            onBoardingCubit
                                                    .onBoardingTitleHighlighted[
                                                onBoardingCubit
                                                    .onBoardingIndex],
                                            style: TextStyle(
                                              color: AppColors.neutralColor100,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 24.sp,
                                              height: 1.2,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  onBoardingCubit.onBoardingDescriptions[
                                      onBoardingCubit.onBoardingIndex],
                                  style: Styles.captionBold.copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.neutralColor600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 10.h),
                                DotsIndicator(
                                  dotsCount: onBoardingCubit
                                      .onBoardingImageUrls.length,
                                  position: onBoardingCubit.onBoardingIndex,
                                  decorator: DotsDecorator(
                                    activeColor: AppColors.primaryColor900,
                                    color: const Color(0xFF005430)
                                        .withValues(alpha: 0.1),
                                    size: Size(30.r, 5.r),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                    activeSize: Size(30.r, 5.r),
                                    activeShape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                CustomButtonWidget(
                                  text: onBoardingCubit.onBoardingIndex ==
                                          onBoardingCubit
                                                  .onBoardingImageUrls.length -
                                              1
                                      ? 'startNow'.tr()
                                      : 'next'.tr(),
                                  onPressed: () async {
                                    if (onBoardingCubit.onBoardingIndex ==
                                        onBoardingCubit
                                                .onBoardingImageUrls.length -
                                            1) {
                                      await CacheHelper.saveData(
                                          key: CacheKeys.isFirstOpen,
                                          value: true);
                                      context.pushNamedAndRemoveUntil(
                                          Routes.mainLayoutScreen);
                                    } else {
                                      _animateToPage(
                                          onBoardingCubit.onBoardingIndex + 1);
                                    }
                                  },
                                ),
                                SizedBox(height: 20.h),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
