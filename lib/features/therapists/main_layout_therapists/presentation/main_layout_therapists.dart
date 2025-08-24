import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:truee_balance_app/core/routing/app_router.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';
import 'package:truee_balance_app/features/therapists/main_layout_therapists/business_logic/main_layout_therapists_cubit.dart';

class MainLayoutTherapistsScreen extends StatelessWidget {
  const MainLayoutTherapistsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainLayoutTherapistsCubit, MainLayoutTherapistsState>(
      builder: (BuildContext context, state) {
        final cubit = MainLayoutTherapistsCubit.get(context);
        final currentIndex = (state is BottomNavTherapistsState)
            ? state.currentIndex
            : AppConstants.userMainLayoutInitialScreenIndex3;
        return Scaffold(
          backgroundColor: AppColors.neutralColor100,
          body: AppRouter().screensTherapist[currentIndex],
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
            ),
            child: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              elevation: 0.0,
              notchMargin: 8.0,
              color: AppColors.primaryColor900,
              child: SizedBox(
                height: 70.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem(
                      icon: 'assets/images/svg/home_icon.svg',
                      label: 'home'.tr(),
                      index: 0,
                      currentIndex: currentIndex,
                      onTap: () => cubit.changeBottomNavBar(0),
                    ),
                    _buildNavItem(
                      icon: 'assets/images/svg/notification-therep.svg',
                      label: 'Notifications'.tr(),
                      index: 1,
                      currentIndex: currentIndex,
                      onTap: () => cubit.changeBottomNavBar(1),
                    ),
                    _buildNavItem(
                      icon: 'assets/images/svg/setting_therep.svg',
                      label: 'Setting'.tr(),
                      index: 2,
                      currentIndex: currentIndex,
                      onTap: () => cubit.changeBottomNavBar(2),
                    ),
                  ],
                ),
              ),
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
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            icon,
            width: 24.sp,
            height: 20.sp,
            colorFilter: ColorFilter.mode(
              isSelected
                  ? AppColors.neutralColor100
                  : AppColors.neutralColor300,
              BlendMode.srcIn,
            ),
          ),
          Text(
            label,
            style: isSelected
                ? Styles.footnoteBold.copyWith(
                    color: AppColors.neutralColor100,
                  )
                : Styles.footnoteEmphasis.copyWith(
                    color: AppColors.neutralColor300,
                  ),
          ),
        ],
      ),
    );
  }
}
