import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:true_balance_app/core/themes/app_colors.dart';
import 'package:true_balance_app/core/widgets/saudi_riyal_icon.dart';
import 'package:true_balance_app/features/user/create%20booking/bloc/cubit/create_booking_cubit.dart';
import 'package:true_balance_app/features/user/doctor_details/data/model/doctor_details_model.dart';

class EnhancedSessionSelector extends StatelessWidget {
  final DoctorModelDetails doctor;
  final int numberOfDays;

  const EnhancedSessionSelector({
    super.key,
    required this.doctor,
    this.numberOfDays = 14,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDoctorCard(),
          16.verticalSpace,
          _buildDateSelector(context),
          16.verticalSpace,
          _buildTimeSlots(context),
        ],
      ),
    );
  }

  Widget _buildDoctorCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withAlpha(13),
              blurRadius: 10,
              offset: const Offset(0, 4))
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: CachedNetworkImage(
              imageUrl: doctor.image ?? '',
              width: 70.w,
              height: 70.w,
              fit: BoxFit.cover,
              placeholder: (_, __) => Container(
                width: 70.w,
                height: 70.w,
                color: AppColors.neutralColor200,
                child: Icon(Icons.person,
                    size: 35.sp, color: AppColors.neutralColor400),
              ),
              errorWidget: (_, __, ___) => Container(
                width: 70.w,
                height: 70.w,
                color: AppColors.neutralColor200,
                child: Icon(Icons.person,
                    size: 35.sp, color: AppColors.neutralColor400),
              ),
            ),
          ),
          14.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctor.name ?? 'Doctor',
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.neutralColor900),
                ),
                4.verticalSpace,
                Text(
                  doctor.specialization ?? 'Specialization',
                  style: TextStyle(
                      fontSize: 13.sp, color: AppColors.neutralColor500),
                ),
                6.verticalSpace,
                Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
                      decoration: BoxDecoration(
                          color: Colors.amber.withAlpha(26),
                          borderRadius: BorderRadius.circular(4.r)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star,
                              size: 12.sp, color: Colors.amber.shade700),
                          2.horizontalSpace,
                          Text('${doctor.rate ?? 0}.0',
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.amber.shade700)),
                        ],
                      ),
                    ),
                    6.horizontalSpace,
                    Text('(${doctor.rateCount ?? 0} ${'reviews'.tr()})',
                        style: TextStyle(
                            fontSize: 11.sp, color: AppColors.neutralColor400)),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RiyalAmount(
                amount: doctor.consultationPrice?.toStringAsFixed(0) ?? '150',
                fontSize: 16,
                color: AppColors.primaryColor900,
                fontWeight: FontWeight.bold,
              ),
              4.verticalSpace,
              Text('consultationPrice'.tr(),
                  style: TextStyle(
                      fontSize: 10.sp, color: AppColors.neutralColor400)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDateSelector(BuildContext context) {
    final dates = _generateDates(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.calendar_today,
                size: 18.sp, color: AppColors.primaryColor900),
            8.horizontalSpace,
            Text('selectDate'.tr(),
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.neutralColor900)),
          ],
        ),
        12.verticalSpace,
        SizedBox(
          height: 85.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dates.length,
            itemBuilder: (context, index) {
              final isSelected =
                  context.watch<CreateBookingCubit>().selectedDateIndex ==
                      index;
              final date = dates[index];

              return GestureDetector(
                onTap: () => context
                    .read<CreateBookingCubit>()
                    .selectDate(index: index, date: date['datetime']),
                child: Container(
                  width: 60.w,
                  margin: EdgeInsets.only(right: 10.w),
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  decoration: BoxDecoration(
                    color:
                        isSelected ? AppColors.primaryColor900 : Colors.white,
                    border: Border.all(
                        color: isSelected
                            ? AppColors.primaryColor900
                            : AppColors.neutralColor300),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        date['dayShort']!,
                        style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                            color: isSelected
                                ? Colors.white70
                                : AppColors.neutralColor500),
                      ),
                      4.verticalSpace,
                      Text(
                        date['dateNum']!,
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: isSelected
                                ? Colors.white
                                : AppColors.neutralColor900),
                      ),
                      2.verticalSpace,
                      Text(
                        date['month']!,
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: isSelected
                                ? Colors.white70
                                : AppColors.neutralColor400),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTimeSlots(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.access_time,
                size: 18.sp, color: AppColors.primaryColor900),
            8.horizontalSpace,
            Text('selectTime'.tr(),
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.neutralColor900)),
          ],
        ),
        12.verticalSpace,
        BlocBuilder<CreateBookingCubit, CreateBookingState>(
          buildWhen: (previous, current) =>
              current is TimeSelectedState ||
              current is SlotsLoadingState ||
              current is SlotsLoadedState ||
              current is SlotsFailureState,
          builder: (context, state) {
            final selectedTimeIndex =
                context.read<CreateBookingCubit>().selectedTimeIndex;

            if (state is SlotsLoadingState) {
              return Container(
                padding: EdgeInsets.all(30.h),
                child: const Center(child: CircularProgressIndicator()),
              );
            }

            final freeSlots =
                context.read<CreateBookingCubit>().freeSlotsModel?.data;

            if (freeSlots == null || freeSlots.isEmpty) {
              return Container(
                padding: EdgeInsets.all(20.h),
                decoration: BoxDecoration(
                  color: Colors.orange.withAlpha(26),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline,
                        color: Colors.orange.shade700, size: 20.sp),
                    10.horizontalSpace,
                    Text('noSlotsAvailable'.tr(),
                        style: TextStyle(
                            color: Colors.orange.shade700, fontSize: 13.sp)),
                  ],
                ),
              );
            }

            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10.h,
                crossAxisSpacing: 10.w,
                childAspectRatio: 2.2,
              ),
              itemCount: freeSlots.length,
              itemBuilder: (context, index) {
                final isSelected = selectedTimeIndex == index;
                return GestureDetector(
                  onTap: () =>
                      context.read<CreateBookingCubit>().selectTime(index),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color:
                          isSelected ? AppColors.primaryColor900 : Colors.white,
                      border: Border.all(
                          color: isSelected
                              ? AppColors.primaryColor900
                              : AppColors.neutralColor300),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      freeSlots[index],
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: isSelected
                            ? Colors.white
                            : AppColors.neutralColor800,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  List<Map<String, dynamic>> _generateDates(BuildContext context) {
    final now = DateTime.now();
    final locale = context.locale.toString();

    return List.generate(numberOfDays, (i) {
      final date = now.add(Duration(days: i));
      return {
        'dayShort': DateFormat('EEE', locale).format(date),
        'dateNum': date.day.toString(),
        'month': DateFormat('MMM', locale).format(date),
        'datetime': date,
      };
    });
  }
}
