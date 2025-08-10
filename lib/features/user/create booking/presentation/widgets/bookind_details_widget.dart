import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/cache_helper/cache_helper.dart';
import 'package:truee_balance_app/core/cache_helper/cache_keys.dart';
import 'package:truee_balance_app/core/helper_functions/date_formate.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/features/user/create%20booking/bloc/cubit/create_booking_cubit.dart';
import 'package:truee_balance_app/features/user/my_booking/widgets/custom_row_make_title_and_desc_widget.dart';

class BookingDetailsWidget extends StatelessWidget {
  const BookingDetailsWidget({super.key, required this.doctorName});
  final String doctorName;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateBookingCubit>();
    return Column(
      spacing: 18.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(12.sp),
          decoration: BoxDecoration(
            color: AppColors.neutralColor100,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 2.h),
                blurRadius: 8.r,
                spreadRadius: 0,
                color: Colors.black.withAlpha(20),
              ),
            ],
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: AppColors.neutralColor1000.withAlpha(20),
              width: 1.sp,
            ),
          ),
          child: Column(
            spacing: 12.h,
            children: [
              CustomRowMakeTitleAndDescWidget(
                  title: 'date'.tr(),
                  description: formatDate(cubit.data.toString())),
              CustomRowMakeTitleAndDescWidget(
                  title: 'time'.tr(),
                  description:
                      cubit.freeSlotsModel!.data[cubit.selectedTimeIndex]),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(12.sp),
          decoration: BoxDecoration(
            color: AppColors.neutralColor100,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 2.h),
                blurRadius: 8.r,
                spreadRadius: 0,
                color: Colors.black.withAlpha(20),
              ),
            ],
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: AppColors.neutralColor1000.withAlpha(20),
              width: 1.sp,
            ),
          ),
          child: Column(
            spacing: 12.h,
            children: [
              CustomRowMakeTitleAndDescWidget(
                title: 'name'.tr(),
                description: CacheHelper.getData(key: CacheKeys.userName),
              ),
              CustomRowMakeTitleAndDescWidget(
                  title: 'phoneNumberOnly'.tr(),
                  description:
                      CacheHelper.getData(key: CacheKeys.userPhone) ?? " "),
              CustomRowMakeTitleAndDescWidget(
                  title: 'therapistsName'.tr(), description: doctorName),
            ],
          ),
        ),
      ],
    );
  }
}
