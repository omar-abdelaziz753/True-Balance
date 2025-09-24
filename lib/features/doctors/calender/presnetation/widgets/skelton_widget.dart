import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:truee_balance_app/features/doctors/calender/presnetation/widgets/calender_widget.dart';

import 'appointment_card.dart';

class SkeltonWidget extends StatelessWidget {
  const SkeltonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Column(
        children: [
          const CalendarWidget(),
          SizedBox(height: 20.h),
          Expanded(
            child: ListView.separated(
              itemCount: 6,
              separatorBuilder: (_, __) => 12.verticalSpace,
              itemBuilder: (_, __) => const AppointmentCard(
                time: "10:00 AM",
                name: "Loading...",
                specialization: "Specialization",
                status: "pending", imageUrl: '',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
