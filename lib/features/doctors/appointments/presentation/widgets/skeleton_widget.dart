import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/features/doctors/appointments/presentation/widgets/custom_appointment_counter_widget.dart';

class AppointmentsSkeletonWidget extends StatelessWidget {
  const AppointmentsSkeletonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: 7,
              separatorBuilder: (context, index) => 18.verticalSpace,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    context.pushNamed(Routes.appointmentsDetailsScreen);
                  },
                  child: const CustomAppointmentContainerWidget(
                    isLoading: true,
                    title: "Ahmed Adel",
                    phone: "+1 111 467 378 399",
                    imagePath: "assets/images/svg/appointments_rounded.svg",
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
