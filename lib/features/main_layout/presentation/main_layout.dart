import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:truee_balance_app/core/routing/app_router.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/features/main_layout/business_logic/main_layout_cubit.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key, this.index = 0});
  final int? index;

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      Future.microtask(() {
        if (!mounted) return; // ✅ Prevent using context if disposed
        MainLayoutCubit.get(context).changeBottomNavBar(widget.index!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainLayoutCubit, MainLayoutState>(
      builder: (context, state) {
        final cubit = MainLayoutCubit.get(context);
        final currentIndex = (state is BottomNavState) ? state.currentIndex : 0;

        return Scaffold(
          backgroundColor: AppColors.neutralColor100,
          body: AppRouter().screens[currentIndex],
          bottomNavigationBar: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              showSelectedLabels: true,
              showUnselectedLabels: true,
              currentIndex: currentIndex,
              type: BottomNavigationBarType.fixed,
              backgroundColor: AppColors.neutralColor100,
              selectedItemColor: AppColors.primaryColor900,
              selectedLabelStyle: Styles.captionBold,
              unselectedItemColor: AppColors.neutralColor1000,
              unselectedLabelStyle: Styles.captionEmphasis,
              onTap: (index) => cubit.changeBottomNavBar(index),
              items: [
                _bottomItem('assets/images/svg/home_icon.svg', 'Home', currentIndex == 0),
                _bottomItem('assets/images/svg/therapists_icon.svg', 'Therapists', currentIndex == 1),
                _bottomItem('assets/images/svg/resources_icon.svg', 'Resources', currentIndex == 2),
                _bottomItem('assets/images/svg/setting_icon.svg', 'Setting', currentIndex == 3),
              ],
            ),
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _bottomItem(String asset, String label, bool isSelected) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: SvgPicture.asset(
          asset,
          colorFilter: ColorFilter.mode(
            isSelected ? AppColors.primaryColor900 : AppColors.neutralColor1000,
            BlendMode.srcIn,
          ),
        ),
      ),
      label: label,
    );
  }
}
