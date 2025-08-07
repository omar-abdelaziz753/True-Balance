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

// class MainLayoutScreen extends StatelessWidget {
//   const MainLayoutScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<MainLayoutCubit, MainLayoutState>(
//       builder: (BuildContext context, state) {
//         final cubit = MainLayoutCubit.get(context);
//         final currentIndex = (state is BottomNavState)
//             ? state.currentIndex
//             : AppConstants.userMainLayoutInitialScreenIndex;

//         return Scaffold(

//           backgroundColor: AppColors.neutralColor100,
//           body: AppRouter().screens[currentIndex],
//           floatingActionButton: GestureDetector(
//             onTap: () {
//               cubit.changeBottomNavBar(2);
//             },
//             child: Container(
//               padding: EdgeInsets.all(13.sp),
//               decoration: BoxDecoration(
//                 color: AppColors.primaryColor900,
//                 shape: BoxShape.circle,
//                 boxShadow: [
//                   const BoxShadow(
//                     color: Colors.black26,
//                     blurRadius: 6,
//                     offset: Offset(0, 4),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const Icon(
//                     Icons.card_travel,
//                     color: Colors.white,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(5.0),
//                     child: Text(
//                       'booking'.tr(),
//                       style:
//                           Styles.footnoteEmphasis.copyWith(color: Colors.white),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           floatingActionButtonLocation:
//               FloatingActionButtonLocation.centerDocked,
//           bottomNavigationBar: BottomNavigationBar(
//             currentIndex: currentIndex,
//             selectedItemColor: AppColors.primaryColor900,
//             unselectedItemColor: AppColors.neutralColor1000,
//             selectedLabelStyle: Styles.captionBold,
//             unselectedLabelStyle: Styles.captionEmphasis,
//             showSelectedLabels: true,
//             showUnselectedLabels: true,
//             type: BottomNavigationBarType.fixed,
//             backgroundColor: Colors.transparent,
//             elevation: 0,
//             onTap: (index) => cubit.changeBottomNavBar(index),
//             items: [
//               BottomNavigationBarItem(
//                 icon: _navIcon('assets/images/svg/home_icon.svg',
//                     index: 0, currentIndex: currentIndex),
//                 label: 'home'.tr(),
//               ),
//               BottomNavigationBarItem(
//                 icon: _navIcon('assets/images/svg/therapists_icon.svg',
//                     index: 1, currentIndex: currentIndex),
//                 label: 'therapists'.tr(),
//               ),
//               const BottomNavigationBarItem(
//                 icon: SizedBox.shrink(),
//                 label: '',
//               ),
//               BottomNavigationBarItem(
//                 icon: _navIcon('assets/images/svg/resources_icon.svg',
//                     index: 3, currentIndex: currentIndex),
//                 label: 'resources'.tr(),
//               ),
//               BottomNavigationBarItem(
//                 icon: _navIcon('assets/images/svg/setting_icon.svg',
//                     index: 4, currentIndex: currentIndex),
//                 label: 'setting'.tr(),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _navIcon(String asset,
//       {required int index, required int currentIndex}) {
//     return SvgPicture.asset(
//       asset,
//       width: 24.sp,
//       height: 20.sp,
//       fit: BoxFit.scaleDown,
//       colorFilter: ColorFilter.mode(
//         index == currentIndex
//             ? AppColors.primaryColor900
//             : AppColors.neutralColor1000,
//         BlendMode.srcIn,
//       ),
//     );
//   }
// }
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
                    size: 30.sp,
                    Icons.wallet,
                    color: AppColors.neutralColor100,
                  ),
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
                    icon: 'assets/images/svg/therapists_icon.svg',
                    label: 'doctors'.tr(),
                    index: 1,
                    currentIndex: currentIndex,
                    onTap: () => cubit.changeBottomNavBar(1),
                  ),
                  const SizedBox(width: 40),
                  _buildNavItem(
                    icon: 'assets/images/svg/mysessions_icon.svg',
                    label: 'My Sessions'.tr(),
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
                ? Styles.footnoteBold.copyWith(color: AppColors.neutralColor100)
                : Styles.footnoteEmphasis
                    .copyWith(color: AppColors.neutralColor300),
          ),
        ],
      ),
    );
  }
}
