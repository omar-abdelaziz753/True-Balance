
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/features/user/add%20session/bloc/cubit/add_session_cubit.dart';

Future<void> pickSession(BuildContext context, AddSessionCubit cubit) async {
  final availableAppointments = cubit.treatmentPlanDetail.availableAppointments;

  final sortedDates = availableAppointments
      .map((a) => DateFormat('dd-MM-yyyy').parse(a.day))
      .where((date) => !date.isBefore(DateTime.now()))
      .toList()
    ..sort();

  if (sortedDates.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("No future available sessions."),
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
      final formatted = DateFormat('dd-MM-yyyy').format(date);
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

  final formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
  final times =
      availableAppointments.firstWhere((a) => a.day == formattedDate).slots;

  String? selectedTime = await showDialog<String>(
    context: context,
    builder: (_) => SimpleDialog(
      backgroundColor: Colors.white,
      title: const Text("Select Time"),
      children: times
          .map(
            (time) => SimpleDialogOption(
              onPressed: () => Navigator.pop(context, time),
              child: Text(time),
            ),
          )
          .toList(),
    ),
  );

  if (selectedTime == null) return;

  if (cubit.selectedItems
      .any((item) => item.date == formattedDate && item.time == selectedTime)) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("This session is already selected."),
        backgroundColor: Colors.orange,
      ),
    );
    return;
  }

  cubit.addSelectedItem(
    SelecteItem(date: formattedDate, time: selectedTime),
  );
}

