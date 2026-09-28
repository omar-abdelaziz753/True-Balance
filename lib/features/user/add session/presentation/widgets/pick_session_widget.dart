import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:true_balance_app/core/themes/app_colors.dart';
import 'package:true_balance_app/features/user/add%20session/bloc/cubit/add_session_cubit.dart';

Future<void> pickSession(BuildContext context, AddSessionCubit cubit) async {
  final availableAppointments = cubit.treatmentPlanDetail.availableAppointments;

  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);

  final sortedDates = availableAppointments
      .map((a) => DateFormat('dd-MM-yyyy', 'en_US').parse(a.day))
      .where((date) => !date.isBefore(today))
      .toList()
    ..sort();

  if (sortedDates.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("nofutureAvailable".tr()),
        backgroundColor: Colors.red,
      ),
    );
    return;
  }

  final firstAvailableDate = sortedDates.first;

  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: firstAvailableDate,
    firstDate: DateTime.now(),
    lastDate: DateTime.now().add(const Duration(days: 30)),
    selectableDayPredicate: (date) {
      final formatted = DateFormat('dd-MM-yyyy', 'en_US').format(date);
      return availableAppointments.any((a) => a.day == formatted);
    },
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: AppColors.primaryColor900,
            onPrimary: Colors.white,
            surface: Colors.white,
            onSurface: AppColors.neutralColor900,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: AppColors.primaryColor900,
            ),
          ),
          dialogTheme: const DialogThemeData(backgroundColor: Colors.white),
        ),
        child: child!,
      );
    },
  );

  if (pickedDate == null) return;
  if (!context.mounted) return;

  final formattedDate = DateFormat('dd-MM-yyyy', 'en_US').format(pickedDate);
  final times =
      availableAppointments.firstWhere((a) => a.day == formattedDate).slots;

  // Remove duplicates from times
  final uniqueTimes = times.toSet().toList()..sort();

  final messenger = ScaffoldMessenger.of(context);
  String? selectedTime = await showModalBottomSheet<String>(
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => _TimeSlotPicker(
      date: formattedDate,
      times: uniqueTimes,
    ),
  );

  if (selectedTime == null) return;
  if (!context.mounted) return;

  if (cubit.selectedItems
      .any((item) => item.date == formattedDate && item.time == selectedTime)) {
    messenger.showSnackBar(
      SnackBar(
        content: Text('sessionAlreadySelected'.tr()),
        backgroundColor: Colors.red,
      ),
    );
    return;
  }

  cubit.addSelectedItem(
    SelecteItem(date: formattedDate, time: selectedTime),
  );
}

class _TimeSlotPicker extends StatelessWidget {
  final String date;
  final List<String> times;

  const _TimeSlotPicker({required this.date, required this.times});

  @override
  Widget build(BuildContext context) {
    final parsedDate = DateFormat('dd-MM-yyyy', 'en_US').parse(date);
    final formattedDisplay = DateFormat('EEEE, MMMM d').format(parsedDate);

    return Container(
      padding: EdgeInsets.all(20.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            formattedDisplay,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.neutralColor900,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            '${times.length} available times',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.neutralColor600,
            ),
          ),
          SizedBox(height: 20.h),
          Wrap(
            spacing: 12.w,
            runSpacing: 12.h,
            children: times.map((time) {
              return _TimeSlotChip(time: time);
            }).toList(),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}

class _TimeSlotChip extends StatelessWidget {
  final String time;

  const _TimeSlotChip({required this.time});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context, time),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.neutralColor300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          time,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.neutralColor900,
          ),
        ),
      ),
    );
  }
}
