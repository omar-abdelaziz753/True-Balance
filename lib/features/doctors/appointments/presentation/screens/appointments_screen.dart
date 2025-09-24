import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/cache_helper/cache_helper.dart';
import 'package:truee_balance_app/core/cache_helper/cache_keys.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/routing/app_router.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/core/widgets/text_field/custom_text_form_field_widget.dart';
import 'package:truee_balance_app/features/doctors/appointments/bloc/cubit/appointments_cubit.dart';
import 'package:truee_balance_app/features/doctors/appointments/bloc/cubit/appointments_state.dart';
import 'package:truee_balance_app/features/doctors/appointments/presentation/widgets/custom_appointment_counter_widget.dart';
import 'package:truee_balance_app/features/doctors/appointments/presentation/widgets/skeleton_widget.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key, required this.showLeading});
  final bool showLeading;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppointmentsCubit>();

    return Scaffold(
        backgroundColor: AppColors.primaryColor900,
        appBar: CustomBasicAppBar(
          leading: showLeading
              ? BackButton(
                  color: AppColors.neutralColor100,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              : const SizedBox.shrink(),
          title: 'patinets'.tr(),
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
          child: Column(
            children: [
              CustomTextFormFieldWidget(
                controller: cubit.searchController,
                hintText: "search".tr(),
                onChanged: (value) {
                  debouncer.debounce(
                    duration: const Duration(milliseconds: 800),
                    onDebounce: () {
                      cubit.getAllDoctorsConsultations(
                          isPending: cubit.isPending!);
                    },
                  );
                },
              ),
              10.verticalSpace,
              BlocBuilder<AppointmentsCubit, AppointmentsState>(
                buildWhen: (previous, current) =>
                    current is AppointmentsSuccess ||
                    current is AppointmentsError ||
                    current is AppointmentsLoading,
                builder: (context, state) {
                  if (state is AppointmentsLoading) {
                    return const Expanded(child: AppointmentsSkeletonWidget());
                  }
                  return cubit.consultationUsersResponse?.data?.data?.isEmpty ??
                          true
                      ? Expanded(
                          child: Center(child: Text('noAppointmentsYet'.tr())),
                        )
                      : Expanded(
                          child: ListView.separated(
                            controller:
                                cubit.consultationsdoctorsScrollController,
                            itemCount: cubit.consultationUsersResponse?.data
                                    ?.data?.length ??
                                0,
                            separatorBuilder: (context, index) =>
                                18.verticalSpace,
                            itemBuilder: (context, index) {
                              final item = cubit.consultationUsersResponse!
                                  .data!.data![index];
                              return InkWell(
                                onTap: () {
                                  if (CacheHelper.getData(
                                          key: CacheKeys.type) ==
                                      'doctor') {
                                    context.pushNamed(
                                      Routes.appointmentsDetailsScreen,
                                      arguments: AppointmentsArguments(
                                        isPending: cubit.isPending!,
                                        userData: item,
                                      ),
                                    );
                                  } else {
                                    context.pushNamed(
                                      Routes.treatmentPlanForTherapists,
                                      arguments: AppointmentsArguments(
                                        isPending: cubit.isPending!,
                                        userData: item,
                                      ),
                                    );
                                  }
                                },
                                child: CustomAppointmentContainerWidget(
                                  title: item.name ?? '',
                                  phone: item.phone ?? '',
                                  imagePath: item.image ?? '',
                                ),
                              );
                            },
                          ),
                        );
                },
              ),
              BlocBuilder<AppointmentsCubit, AppointmentsState>(
                buildWhen: (previous, current) =>
                    current is AppointmentsLoadingMore ||
                    current is AppointmentsSuccess,
                builder: (context, state) {
                  if (state is AppointmentsLoadingMore) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ));
  }
}
