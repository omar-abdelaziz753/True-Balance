import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/helper_functions/flutter_toast.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';
import 'package:truee_balance_app/core/widgets/text_field/custom_text_form_field_widget.dart';
import 'package:truee_balance_app/features/doctors/appointments_details/bloc/cubit/appointments_details_cubit.dart';
import 'package:truee_balance_app/features/doctors/appointments_details/data/model/appointment_details_model.dart';
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
                  Row(
                    spacing: 10.sp,
                    children: [
                      Expanded(
                        child: Text(
                          "status",
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
                              ? const Color(0xFFFFDB43).withOpacity(0.1)
                              : const Color(0xFF4CAF50).withOpacity(0.1),
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

class ConsultationBottomSheet extends StatefulWidget {
  final int consultationId;

  const ConsultationBottomSheet({super.key, required this.consultationId});

  @override
  State<ConsultationBottomSheet> createState() =>
      _ConsultationBottomSheetState();
}

class _ConsultationBottomSheetState extends State<ConsultationBottomSheet> {
  final TextEditingController _evaluationController = TextEditingController();
  File? _selectedFile;

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );
    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    }
  }

  void _submit() async {
    if (_evaluationController.text.isEmpty || _selectedFile == null) {
      customToast(
          msg: 'Please enter all required fields',
          color: AppColors.redColor100);
      return;
    }

    bool success =
        await context.read<AppointmentsDetailsCubit>().completeConsultation(
              consultationId: widget.consultationId,
              doctorEvaluation: _evaluationController.text,
              file: _selectedFile!,
            );

    if (success) {
      Navigator.of(context).pop();
      Navigator.of(context).pop(true);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextFormFieldWidget(
            controller: _evaluationController,
            labelText: 'Doctor Evaluation',
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: _pickFile,
                icon: const Icon(Icons.upload_file),
                label: const Text('Upload File'),
              ),
              SizedBox(width: 12.w),
              if (_selectedFile != null)
                Expanded(
                  child: Text(
                    _selectedFile!.path.split('/').last,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            ],
          ),
          SizedBox(height: 24.h),
          CustomButtonWidget(
            onPressed: _submit,
            text: 'Submit',
          ),
        ],
      ),
    );
  }
}
