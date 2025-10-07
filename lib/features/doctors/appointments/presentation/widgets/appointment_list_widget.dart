import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/cache_helper/cache_helper.dart';
import 'package:truee_balance_app/core/cache_helper/cache_keys.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/routing/app_router.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/features/doctors/appointments/bloc/cubit/appointments_cubit.dart';
import 'package:truee_balance_app/features/doctors/appointments/bloc/cubit/appointments_state.dart';
import 'package:truee_balance_app/features/doctors/appointments/presentation/widgets/custom_appointment_counter_widget.dart';
import 'package:truee_balance_app/features/doctors/appointments/presentation/widgets/skeleton_widget.dart';

class AppointmentListWidget extends StatelessWidget {
  const AppointmentListWidget({
    super.key,
    required this.cubit,
  });

  final AppointmentsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentsCubit, AppointmentsState>(
      buildWhen: (previous, current) =>
          current is AppointmentsSuccess ||
          current is AppointmentsError ||
          current is AppointmentsLoading,
      builder: (context, state) {
        if (state is AppointmentsLoading) {
          return const Expanded(child: AppointmentsSkeletonWidget());
        }
        return cubit.consultationUsersResponse?.data?.data?.isEmpty ?? true
            ? Expanded(
                child: Center(child: Text('noAppointmentsYet'.tr())),
              )
            : Expanded(
                child: ListView.separated(
                  controller: cubit.consultationsdoctorsScrollController,
                  itemCount:
                      cubit.consultationUsersResponse?.data?.data?.length ?? 0,
                  separatorBuilder: (context, index) => 18.verticalSpace,
                  itemBuilder: (context, index) {
                    final item =
                        cubit.consultationUsersResponse!.data!.data![index];
                    return InkWell(
                      onTap: () {
                        if (CacheHelper.getData(key: CacheKeys.type) ==
                            'doctor') {
                          context
                              .pushNamed(
                            Routes.appointmentsDetailsScreen,
                            arguments: AppointmentsArguments(
                              isPending: cubit.isPending!,
                              userData: item,
                            ),
                          )
                              .then((value) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          });
                        } else {
                          context
                              .pushNamed(
                            Routes.treatmentPlanForTherapists,
                            arguments: AppointmentsArguments(
                              isPending: cubit.isPending!,
                              userData: item,
                            ),
                          )
                              .then((value) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          });
                        }
                      },
                      child: CustomAppointmentContainerWidget(
                        title: item.name ?? '',
                        phone: item.phone ?? '', 
                        imagePath: item.image ?? '',
                        age: item.age,
                        gender: item.gender,
                      ),
                    );
                  },
                ),
              );
      },
    );
  }
}
