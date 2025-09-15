import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:truee_balance_app/core/routing/app_router.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';
import 'package:truee_balance_app/features/user/main_layout/business_logic/main_layout_cubit.dart';

class MainLayoutScreen extends StatelessWidget {
  const MainLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainLayoutCubit, MainLayoutState>(
      builder: (BuildContext context, state) {
        final cubit = MainLayoutCubit.get(context);
        final currentIndex = (state is BottomNavState)
            ? state.currentIndex
            : AppConstants.userMainLayoutInitialScreenIndex;

        return Scaffold(
          backgroundColor: AppColors.neutralColor100,
          body: AppRouter().screens[currentIndex],
          floatingActionButton: GestureDetector(
            onTap: () {
              cubit.changeBottomNavBar(2);
            },
            child: Container(
              padding: EdgeInsets.all(11.sp),
              decoration: BoxDecoration(
                color: AppColors.secondaryColor500,
                shape: BoxShape.circle,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.wallet,
                    color: AppColors.neutralColor100,
                    size: 29.sp,
                  )
                  // SvgPicture.asset(
                  //   'assets/images/svg/booking_icon.svg',
                  //   color: AppColors.neutralColor100,
                  //   width: 27.w,
                  //   height: 27.h,
                  // ),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            height: 60.h,
            shape: const CircularNotchedRectangle(),
            elevation: 0.0,
            notchMargin: 8.0,
            color: AppColors.primaryColor900,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(
                  icon: 'assets/images/svg/home_icon.svg',
                  label: 'home'.tr(),
                  index: 0,
                  currentIndex: currentIndex,
                  onTap: () => cubit.changeBottomNavBar(0),
                ),
                _buildNavItem(
                  icon: 'assets/images/svg/therapists_icon.svg',
                  label: 'doctors'.tr(),
                  index: 1,
                  currentIndex: currentIndex,
                  onTap: () => cubit.changeBottomNavBar(1),
                ),
                const Expanded(child: SizedBox()),
                _buildNavItem(
                  icon: 'assets/images/svg/mysessions_icon.svg',
                  label: 'consults'.tr(),
                  index: 3,
                  currentIndex: currentIndex,
                  onTap: () => cubit.changeBottomNavBar(3),
                ),
                _buildNavItem(
                  icon: 'assets/images/svg/setting_icon.svg',
                  label: 'setting'.tr(),
                  index: 4,
                  currentIndex: currentIndex,
                  onTap: () => cubit.changeBottomNavBar(4),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavItem({
    required String icon,
    required String label,
    required int index,
    required int currentIndex,
    required VoidCallback onTap,
  }) {
    final isSelected = index == currentIndex;
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: SvgPicture.asset(
                icon,
                colorFilter: ColorFilter.mode(
                  isSelected
                      ? AppColors.neutralColor100
                      : AppColors.neutralColor300,
                  BlendMode.srcIn,
                ),
              ),
            ),
            Text(
              label,
              style: isSelected
                  ? Styles.footnoteBold
                      .copyWith(color: AppColors.neutralColor100)
                  : Styles.footnoteEmphasis
                      .copyWith(color: AppColors.neutralColor300),
            ),
          ],
        ),
      ),
    );
  }
}
