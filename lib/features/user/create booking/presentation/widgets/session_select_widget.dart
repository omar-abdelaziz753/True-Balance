import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/features/user/create%20booking/bloc/cubit/create_booking_cubit.dart';

class SessionSelector extends StatelessWidget {
  final int numberOfDays;

  const SessionSelector({
    super.key,
    this.numberOfDays = 30,
  });

  List<Map<String, dynamic>> generateSessionDates(int days) {
    final now = DateTime.now();
    return List.generate(days, (i) {
      final date = now.add(Duration(days: i));
      return {
        'day': DateFormat('EEEE').format(date),
        'date': DateFormat('MMMM d').format(date),
        'datetime': date, // include raw DateTime
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    final dates = generateSessionDates(numberOfDays);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'sessionDate'.tr(),
          style: Styles.highlightAccent,
        ),
        10.verticalSpace,
        BlocBuilder<CreateBookingCubit, CreateBookingState>(
          buildWhen: (previous, current) => current is DateSelectedState,
          builder: (context, state) {
            final selectedDateIndex =
                context.read<CreateBookingCubit>().selectedDateIndex;

            // return SizedBox(
            //   height: 90.h,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: dates.length,
            //     itemBuilder: (context, index) {
            //       final isSelected = selectedDateIndex == index;
            //       return GestureDetector(
            //         onTap: () =>
            //             context.read<CreateBookingCubit>().selectDate(index),
            //         child: Container(
            //           width: 120.w,
            //           margin: EdgeInsets.only(right: 10.w),
            //           padding: EdgeInsets.all(12.sp),
            //           decoration: BoxDecoration(
            //             color: isSelected
            //                 ? AppColors.primaryColor900
            //                 : Colors.white,
            //             border: Border.all(color: AppColors.primaryColor900),
            //             borderRadius: BorderRadius.circular(8.r),
            //           ),
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Text(
            //                 dates[index]['day']!,
            //                 style: Styles.footnoteSemiboldBold.copyWith(
            //                   color: isSelected
            //                       ? AppColors.neutralColor100
            //                       : AppColors.neutralColor600,
            //                 ),
            //               ),
            //               4.verticalSpace,
            //               Text(
            //                 dates[index]['date']!,
            //                 style: Styles.contentAccent.copyWith(
            //                   color: isSelected
            //                       ? AppColors.neutralColor100
            //                       : AppColors.neutralColor900,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // );

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(dates.length, (index) {
                  final isSelected = selectedDateIndex == index;
                  return GestureDetector(
                    onTap: () => context.read<CreateBookingCubit>().selectDate(
                          index: index,
                          date: dates[index]['datetime'],
                        ),
                    child: Container(
                      margin: EdgeInsets.only(right: 10.w),
                      padding: EdgeInsets.all(16.sp),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primaryColor900
                            : Colors.white,
                        border: Border.all(color: AppColors.primaryColor900),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Column(
                        spacing: 12.sp,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            dates[index]['day']!,
                            style: Styles.footnoteSemiboldBold.copyWith(
                              color: isSelected
                                  ? AppColors.neutralColor100
                                  : AppColors.neutralColor600,
                            ),
                          ),
                          Text(
                            dates[index]['date']!,
                            style: Styles.contentAccent.copyWith(
                              color: isSelected
                                  ? AppColors.neutralColor100
                                  : AppColors.neutralColor900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            );
          },
        ),
        20.verticalSpace,
        Text(
          'sessionTime'.tr(),
          style: Styles.highlightAccent,
        ),
        10.verticalSpace,
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
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SlotsFailureState) {
              return Center(
                child: Text(
                  'noSlotsAvailable'.tr(),
                  style: Styles.contentAccent.copyWith(
                    color: AppColors.neutralColor600,
                  ),
                ),
              );
            } else if (state is SlotsLoadedState &&
                context.read<CreateBookingCubit>().freeSlotsModel == null) {
              return Center(
                child: Text(
                  'noSlotsAvailable'.tr(),
                  style: Styles.contentAccent.copyWith(
                    color: AppColors.neutralColor600,
                  ),
                ),
              );
            }
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: context
                  .read<CreateBookingCubit>()
                  .freeSlotsModel!
                  .data
                  .length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10.h,
                crossAxisSpacing: 10.w,
                childAspectRatio: 2.5,
              ),
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
                      border: Border.all(color: AppColors.primaryColor900),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      context
                          .read<CreateBookingCubit>()
                          .freeSlotsModel!
                          .data[index],
                      style: Styles.footnoteSemiboldBold.copyWith(
                        color: isSelected
                            ? AppColors.neutralColor100
                            : AppColors.neutralColor900,
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
}
