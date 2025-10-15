import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';
import 'package:truee_balance_app/core/widgets/text_field/custom_text_form_field_widget.dart';
import 'package:truee_balance_app/features/user/my_booking/bloc/mybook_cubit.dart';

class FilterBottomSheet extends StatefulWidget {
  final MybookCubit cubit;
  const FilterBottomSheet({super.key, required this.cubit});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  late TextEditingController doctorNameController;
  late TextEditingController fromDateController;
  late TextEditingController toDateController;

  @override
  void initState() {
    super.initState();

    doctorNameController =
        TextEditingController(text: widget.cubit.doctorName ?? "");
    fromDateController =
        TextEditingController(text: widget.cubit.fromDate ?? "");
    toDateController = TextEditingController(text: widget.cubit.toDate ?? "");
  }

  @override
  void dispose() {
    doctorNameController.dispose();
    fromDateController.dispose();
    toDateController.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: 16.sp,
        right: 16.sp,
        top: 16.sp,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16.sp,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "filter".tr(),
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          16.verticalSpace,
          CustomTextFormFieldWidget(
            controller: doctorNameController,
            labelText: "doctorName".tr(),
          ),
          12.verticalSpace,
          CustomTextFormFieldWidget(
            controller: fromDateController,
            readOnly: true,
            labelText: "fromDate".tr(),
            onTap: () async {
              final picked = await showAppDatePicker(
                context: context,
              );
              if (picked != null) {
                fromDateController.text =
                    picked.toIso8601String().split('T').first;
              }
            },
          ),
          12.verticalSpace,
          CustomTextFormFieldWidget(
            controller: toDateController,
            readOnly: true,
            labelText: "toDate".tr(),
            onTap: () async {
              final picked = await showAppDatePicker(
                context: context,
              );
              if (picked != null) {
                toDateController.text =
                    picked.toIso8601String().split('T').first;
              }
            },
          ),
          20.verticalSpace,
          Row(
            children: [
              Expanded(
                child: CustomButtonWidget(
                  onPressed: () {
                    if (doctorNameController.text.isEmpty &&
                        fromDateController.text.isEmpty &&
                        toDateController.text.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            style: Styles.highlightBold,
                            "warning".tr(),
                          ),
                          content: Text(
                            style: Styles.captionEmphasis
                                .copyWith(color: AppColors.neutralColor500),
                            "pleaseSelectdoctorName".tr(),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                "ok".tr(),
                                style: TextStyle(
                                  color: AppColors.primaryColor900,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                      return;
                    }
                    widget.cubit.doctorName =
                        doctorNameController.text.isNotEmpty
                            ? doctorNameController.text
                            : null;
                    widget.cubit.fromDate = fromDateController.text.isNotEmpty
                        ? fromDateController.text
                        : null;
                    widget.cubit.toDate = toDateController.text.isNotEmpty
                        ? toDateController.text
                        : null;

                    widget.cubit.getAllconsultations(
                        isPending: widget.cubit.isPending ?? true);
                    Navigator.pop(context);
                  },
                  text: "apply".tr(),
                ),
              ),
              12.horizontalSpace,
              if (widget.cubit.doctorName != null ||
                  widget.cubit.fromDate != null ||
                  widget.cubit.toDate != null)
                Expanded(
                  child: CustomButtonWidget(
                    onPressed: () {
                      doctorNameController.clear();
                      fromDateController.clear();
                      toDateController.clear();

                      widget.cubit.doctorName = null;
                      widget.cubit.fromDate = null;
                      widget.cubit.toDate = null;

                      widget.cubit.getAllconsultations(
                          isPending: widget.cubit.isPending ?? true);
                      Navigator.pop(context);
                    },
                    text: "clear".tr(),
                    color: Colors.red,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

Future<DateTime?> showAppDatePicker({
  required BuildContext context,
  DateTime? initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
  Locale locale = const Locale('en', 'US'),
}) {
  final now = DateTime.now();

  return showDatePicker(
    context: context,
    locale: locale,
    initialDate: initialDate ?? now,
    firstDate: firstDate ?? DateTime(2020),
    lastDate: lastDate ?? DateTime(2100),
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: AppColors.primaryColor800,
            onPrimary: Colors.white,
            onSurface: AppColors.neutralColor900,
            surface: AppColors.neutralColor100,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: AppColors.primaryColor800,
            ),
          ),
          dialogTheme: const DialogThemeData(backgroundColor: Colors.white),
        ),
        child: child!,
      );
    },
  );
}
