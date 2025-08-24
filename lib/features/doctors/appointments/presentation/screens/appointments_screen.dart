import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/routing/app_router.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/features/doctors/appointments/bloc/cubit/appointments_cubit.dart';
import 'package:truee_balance_app/features/doctors/appointments/bloc/cubit/appointments_state.dart';
import 'package:truee_balance_app/features/doctors/appointments/presentation/widgets/custom_appointment_counter_widget.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppointmentsCubit>();
    return BlocBuilder<AppointmentsCubit, AppointmentsState>(
      buildWhen: (previous, current) =>
          current is AppointmentsSuccess ||
          current is AppointmentsError ||
          current is AppointmentsLoading,
      builder: (context, state) {
        if (state is AppointmentsLoading) {
          return Scaffold(
            backgroundColor: AppColors.primaryColor900,
            appBar: CustomBasicAppBar(
              leading: BackButton(
                color: AppColors.neutralColor100,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: 'appointments.'.tr(),
              backgroundColor: AppColors.primaryColor900,
              svgAsset: 'assets/images/svg/bg_image.svg',
            ),
            body: Skeletonizer(
              enabled: true,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(18.sp),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    topRight: Radius.circular(12.r),
                  ),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemCount: 7,
                              separatorBuilder: (context, index) =>
                                  18.verticalSpace,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    context.pushNamed(
                                        Routes.appointmentsDetailsScreen);
                                  },
                                  child: const CustomAppointmentContainerWidget(
                                    isLoading: true,
                                    title: "Ahmed Adel",
                                    phone: "+1 111 467 378 399",
                                    imagePath:
                                        "assets/images/svg/appointments_rounded.svg",
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        }
        return Scaffold(
          backgroundColor: AppColors.primaryColor900,
          appBar: CustomBasicAppBar(
            title: 'appointments.'.tr(),
            backgroundColor: AppColors.primaryColor900,
            svgAsset: 'assets/images/svg/bg_image.svg',
          ),
          body: Container(
            width: double.infinity,
            padding: EdgeInsets.all(18.sp),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r),
              ),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          controller:
                              cubit.consultationsdoctorsScrollController,
                          itemCount: cubit.consultationUsersResponse?.data?.data
                                  ?.length ??
                              0,
                          separatorBuilder: (context, index) =>
                              18.verticalSpace,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                context.pushNamed(
                                  Routes.appointmentsDetailsScreen,
                                  arguments: AppointmentsArguments(
                                      isPending: cubit.isPending!,
                                      userData: cubit.consultationUsersResponse!
                                          .data!.data![index]),
                                );
                              },
                              child: CustomAppointmentContainerWidget(
                                  title: cubit.consultationUsersResponse?.data
                                          ?.data?[index].name ??
                                      '',
                                  phone: cubit.consultationUsersResponse?.data
                                          ?.data?[index].phone ??
                                      '',
                                  imagePath: cubit.consultationUsersResponse
                                          ?.data?.data?[index].image ??
                                      ''),
                            );
                          },
                        ),
                      ),
                      BlocBuilder<AppointmentsCubit, AppointmentsState>(
                        buildWhen: (previous, current) =>
                            current is AppointmentsLoadingMore ||
                            current is AppointmentsSuccess,
                        builder: (context, state) {
                          if (state is AppointmentsLoadingMore) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
