import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/cache_helper/cache_helper.dart';
import 'package:truee_balance_app/core/cache_helper/cache_keys.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/features/doctors/calender/bloc/cubit/calender_cubit.dart';
import 'package:truee_balance_app/features/doctors/calender/data/model/doctor_schedule_model.dart';
import 'package:truee_balance_app/features/doctors/calender/data/model/therapist_schedule_model.dart';

import 'appointment_card.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CalenderCubit>();
    return BlocBuilder<CalenderCubit, CalenderState>(
      buildWhen: (previous, current) => current is BookChangeDateState,
      builder: (context, state) {
        final items = CacheHelper.getData(key: CacheKeys.type) == 'doctor'
            ? cubit.doctorFiletrList
            : cubit.therapistFiletrList;

        return Expanded(
          child: items.isEmpty
              ? Center(
                  child: Text(
                    "no_appointments".tr(),
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.neutralColor600,
                    ),
                  ),
                )
              : ListView.separated(
                  itemCount: items.length,
                  separatorBuilder: (_, __) => 12.verticalSpace,
                  itemBuilder: (context, index) {
                    if (CacheHelper.getData(key: CacheKeys.type) == 'doctor') {
                      final item = items[index] as DoctorScheduleData;
                      return AppointmentCard(
                        time: item.time ?? "",
                        name: item.user?.name ?? "Unknown",
                        specialization: item.user?.phone ?? "",
                        status: item.status ?? "pending",
                        imageUrl: item.user?.image ?? '',
                      );
                    } else {
                      final item = items[index] as TherapistSchedule;
                      return AppointmentCard(
                        time: item.time ?? "",
                        name: item.user?.name ?? "Treatment Plan",
                        specialization: item.user?.phone ?? "",
                        status: item.status ?? "pending",
                        imageUrl: item.user?.image ?? '',
                      );
                    }
                  },
                ),
        );
      },
    );
  }
}
