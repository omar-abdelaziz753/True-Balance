import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/helper_functions/flutter_toast.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';
import 'package:truee_balance_app/core/widgets/text_field/custom_text_form_field_widget.dart';
import 'package:truee_balance_app/features/doctors/appointments_details/bloc/cubit/appointments_details_cubit.dart';

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
    if (_evaluationController.text.isEmpty) {
      customToast(
          msg: 'pleaseenterallrequiredfields'.tr(),
          color: AppColors.redColor100);
      return;
    }

    bool success =
        await context.read<AppointmentsDetailsCubit>().completeConsultation(
              consultationId: widget.consultationId,
              doctorEvaluation: _evaluationController.text,
              file: _selectedFile,
            );

    if (success) {
      Navigator.of(context).pop();
      Navigator.of(context).pop(true);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          top: 20.sp,
          left: 20.sp,
          right: 20.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextFormFieldWidget(
              controller: _evaluationController,
              labelText: 'doctorEvaluation'.tr(),
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: _pickFile,
                  icon: const Icon(Icons.upload_file),
                  label: Text('uploadFile'.tr()),
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
              text: 'Submit'.tr(),
            ),
          ],
        ),
      ),
    );
  }
}
