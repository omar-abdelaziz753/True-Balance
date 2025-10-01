import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/core/widgets/text_field/custom_text_form_field_widget.dart';
import 'package:truee_balance_app/features/doctors/appointments/bloc/cubit/appointments_cubit.dart';
import 'package:truee_balance_app/features/doctors/appointments/bloc/cubit/appointments_state.dart';

import '../widgets/appointment_list_widget.dart';

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
            if (context.watch<AppointmentsCubit>().isNotEmpty &&
                context.watch<AppointmentsCubit>().isFirstTime)
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
            AppointmentListWidget(cubit: cubit),
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
      ),
    );
  }
}
