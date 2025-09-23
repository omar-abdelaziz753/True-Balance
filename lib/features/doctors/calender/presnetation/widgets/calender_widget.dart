import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/features/doctors/calender/bloc/cubit/calender_cubit.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final calenderCubit = BlocProvider.of<CalenderCubit>(context);

    return BlocBuilder<CalenderCubit, CalenderState>(
      buildWhen: (previous, current) => current is BookChangeDateState,
      builder: (context, state) {
        return Column(
          children: [
            TableCalendar(
              daysOfWeekVisible: true,
              focusedDay: calenderCubit.focusedDay,
              firstDay: DateTime.now(),
              lastDay: calenderCubit.endDate,
              currentDay: DateTime.now(),
              calendarFormat: CalendarFormat.month,
              locale: context.locale.toString(),
              onDaySelected: (selectedDay, focusedDay) {
                calenderCubit.chooseBookingDate(selectedDay);
                calenderCubit.updateFocusedDay(selectedDay);
              },
              onPageChanged: calenderCubit.updateFocusedDay,
              selectedDayPredicate: (day) {
                return isSameDay(day, calenderCubit.selectedDate);
              },
              daysOfWeekHeight: 28.sp,
              calendarStyle: CalendarStyle(
                todayDecoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: AppColors.primaryColor900,
                  shape: BoxShape.circle,
                ),
                todayTextStyle: Styles.captionEmphasis.copyWith(
                  color: AppColors.neutralColor900,
                ),
                selectedTextStyle: Styles.captionEmphasis.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                defaultTextStyle: Styles.captionEmphasis.copyWith(
                  fontSize: 13.sp,
                  color: AppColors.neutralColor900,
                ),
                weekendTextStyle: Styles.captionEmphasis.copyWith(
                  fontSize: 13.sp,
                ),
                outsideTextStyle: Styles.captionEmphasis.copyWith(
                  color: AppColors.neutralColor400,
                ),
                disabledTextStyle: Styles.captionEmphasis.copyWith(
                  color: AppColors.neutralColor400,
                ),
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                leftChevronMargin: EdgeInsets.zero,
                rightChevronMargin: EdgeInsets.zero,
                leftChevronIcon: _buildChevron(Icons.chevron_left, context),
                rightChevronIcon: _buildChevron(Icons.chevron_right, context),
                titleTextStyle: Styles.highlightEmphasis.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor900,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.primaryColor900,
                      width: 1.sp,
                    ),
                  ),
                ),
                titleTextFormatter: (date, locale) {
                  return DateFormat.yMMM(locale).format(date);
                },
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: Styles.captionEmphasis.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.neutralColor700,
                ),
                weekendStyle: Styles.captionEmphasis.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor900,
                ),
              ),
            ),
            16.verticalSpace,
            Divider(color: AppColors.neutralColor300, thickness: 1),
          ],
        );
      },
    );
  }

  Widget _buildChevron(IconData icon, BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.primaryColor900),
        color: Colors.white,
      ),
      child: Icon(icon, size: 18.sp, color: Colors.black),
    );
  }
}
