import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';
import 'package:truee_balance_app/features/doctors/appointments_details/bloc/cubit/appointments_details_cubit.dart';
import 'package:truee_balance_app/features/doctors/appointments_details/data/model/appointment_details_model.dart';
import 'package:truee_balance_app/features/doctors/appointments_details/presentation/widgets/consultation_bottom_sheet.dart';
import 'package:truee_balance_app/features/doctors/appointments_details/presentation/widgets/down_load_file_widget.dart';
import 'package:truee_balance_app/features/user/add%20session/presentation/widgets/details_row_widget.dart';

class AppoimntetItemDetailsScreen extends StatelessWidget {
  const AppoimntetItemDetailsScreen(
      {super.key, required this.title, required this.appointmentData});
  final String title;
  final AppointmentData appointmentData;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppointmentsDetailsCubit>();
    return Scaffold(
      backgroundColor: AppColors.primaryColor900,
      appBar: CustomBasicAppBar(
        title: title,
        backgroundColor: AppColors.primaryColor900,
        svgAsset: 'assets/images/svg/bg_image.svg',
        leading: IconButton(
          color: AppColors.neutralColor100,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12.sp),
              decoration: BoxDecoration(
                color: AppColors.neutralColor100,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: AppColors.neutralColor1000.withAlpha(20),
                  width: 1.w,
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 2.h),
                    blurRadius: 8.r,
                    color: Colors.black.withAlpha(20),
                  ),
                ],
              ),
              child: Column(
                spacing: 10.sp,
                children: [
                  DetailsRowWidget(
                      label: 'date'.tr(), value: appointmentData.date!),
                  DetailsRowWidget(
                      label: 'time'.tr(), value: appointmentData.time!),
                  if (appointmentData.status != "pending") ...[
                    DetailsRowWidget(
                        label: 'doctorEvaluation'.tr(),
                        value: appointmentData.doctorEvaluation ?? ""),
                    DownloadFileWidget(appointmentData: appointmentData),
                  ],
                  Row(
                    spacing: 10.sp,
                    children: [
                      Expanded(
                        child: Text(
                          "status".tr(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: Styles.captionEmphasis.copyWith(
                            color: AppColors.neutralColor1000,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: appointmentData.status == 'pending'
                              ? const Color(0xFFFFDB43).withValues(alpha: 0.1)
                              : const Color(0xFF4CAF50).withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(
                              AppConstants.borderRadius - 4.r),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 3.h),
                        child: Text(
                          appointmentData.status == 'pending'
                              ? 'pending'.tr()
                              : 'completed'.tr(),
                          style: Styles.footnoteRegular.copyWith(
                            color: appointmentData.status == 'pending'
                                ? AppColors.yellowColor100
                                : const Color(0xFF4CAF50),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            if (appointmentData.status == 'pending')
              CustomButtonWidget(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16.r)),
                    ),
                    builder: (_) => BlocProvider.value(
                      value: cubit,
                      child: ConsultationBottomSheet(
                        consultationId: appointmentData.id!,
                      ),
                    ),
                  );
                },
                text: 'confirm'.tr(),
              )
          ],
        ),
      ),
    );
  }
}
