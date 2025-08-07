// // test_screen.dart
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:truee_balance_app/core/themes/app_colors.dart';
// import 'package:truee_balance_app/features/user/create%20booking/bloc/cubit/create_booking_cubit.dart';
// import 'package:truee_balance_app/features/user/my_booking/widgets/custom_row_make_title_and_desc_widget.dart';

// class SelectDateAndTimeWidget extends StatelessWidget {
//   const SelectDateAndTimeWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final cubit = context.read<CreateBookingCubit>();

//     Future<void> pickSession() async {
//       final availableDateTime = cubit.available;

//       if (availableDateTime.isEmpty) return;

//       final firstAvailableDate =
//           DateFormat('yyyy-MM-dd').parse(availableDateTime.keys.first);

//       // Date Picker
//       DateTime? pickedDate = await showDatePicker(
//         context: context,
//         initialDate: firstAvailableDate,
//         firstDate: DateTime.now(),
//         lastDate: DateTime.now().add(const Duration(days: 30)),
//         selectableDayPredicate: (date) {
//           final formatted = DateFormat('yyyy-MM-dd').format(date);
//           return availableDateTime.containsKey(formatted);
//         },
//         builder: (context, child) {
//           return Theme(
//             data: Theme.of(context).copyWith(
//               colorScheme: ColorScheme.light(
//                 primary: AppColors.primaryColor900, // selected day background
//                 onPrimary: Colors.white, // selected day text
//                 surface: Colors.white, // dialog background
//                 onSurface: AppColors.neutralColor900, // default day text
//               ),
//               textButtonTheme: TextButtonThemeData(
//                 style: TextButton.styleFrom(
//                   foregroundColor:
//                       AppColors.primaryColor900, // OK/CANCEL button color
//                 ),
//               ),
//               dialogTheme: const DialogThemeData(backgroundColor: Colors.white),
//             ),
//             child: child!,
//           );
//         },
//       );

//       if (pickedDate == null) return;

//       final formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
//       final times = availableDateTime[formattedDate]!;

//       // Time picker
//       String? selectedTime = await showDialog<String>(
//         context: context,
//         builder: (_) => SimpleDialog(
//           backgroundColor: Colors.white,
//           title: const Text("Select Time"),
//           children: times
//               .map(
//                 (time) => SimpleDialogOption(
//                   onPressed: () => Navigator.pop(context, time),
//                   child: Text(time),
//                 ),
//               )
//               .toList(),
//         ),
//       );

//       if (selectedTime == null) return;

//       // cubit.addSession(formattedDate, selectedTime);
//     }

//     return BlocBuilder<CreateBookingCubit, CreateBookingState>(
//       buildWhen: (previous, current) =>
//           current is SlotsFailureState ||
//           current is SlotsLoadedState ||
//           current is SlotsLoadingState,
//       builder: (context, state) {
//         if (state is SlotsLoadingState) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         } else {
//              return ListView.separated(
//           itemCount: cubit.selectedSessions.length,
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           separatorBuilder: (BuildContext context, int index) {
//             return 10.verticalSpace;
//           },
//           itemBuilder: (BuildContext context, int index) {
//             final session = cubit.selectedSessions[index];
//             return Container(
//               padding: EdgeInsets.all(12.sp),
//               decoration: BoxDecoration(
//                 color: AppColors.neutralColor100,
//                 boxShadow: [
//                   BoxShadow(
//                     offset: Offset(0, 2.h),
//                     blurRadius: 8.r,
//                     spreadRadius: 0,
//                     color: Colors.black.withAlpha(20),
//                   ),
//                 ],
//                 borderRadius: BorderRadius.circular(12.r),
//                 border: Border.all(
//                   color: AppColors.neutralColor1000.withAlpha(20),
//                   width: 1.sp,
//                 ),
//               ),
//               child: Column(
//                 spacing: 12.sp,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const CustomRowMakeTitleAndDescWidget(
//                     title: 'Session 1',
//                     description: '',
//                   ),
//                   CustomRowMakeTitleAndDescWidget(
//                       title: 'Session Date', description: session["date"]!),
//                   CustomRowMakeTitleAndDescWidget(
//                       title: 'Session Time', description: session["time"]!),
//                 ],
//               ),
//             );
//           },
//         );
    
       
//         }
    
//       },
//     );
//   }
// }
