import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/features/doctors/calender/bloc/cubit/calender_cubit.dart';
import 'package:truee_balance_app/features/doctors/calender/presnetation/widgets/calender_widget.dart';

import '../widgets/list_widget.dart';
import '../widgets/skelton_widget.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor900,
      appBar: CustomBasicAppBar(
        title: 'appointments'.tr(),
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
        child: BlocBuilder<CalenderCubit, CalenderState>(
          buildWhen: (previous, current) =>
              current is GetDoctorCalenderLoadingState ||
              current is GetDoctorCalenderSuccessState ||
              current is GetDoctorCalenderErrorState,
          builder: (context, state) {
            if (state is GetDoctorCalenderLoadingState) {
              return const SkeltonWidget();
            }

            return Column(
              children: [
                const CalendarWidget(),
                SizedBox(height: 20.h),
                const ListWidget(),
              ],
            );
          },
        ),
      ),
    );
  }
}
