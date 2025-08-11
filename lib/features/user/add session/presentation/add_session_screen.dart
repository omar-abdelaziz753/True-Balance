import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/helper_functions/flutter_toast.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';
import 'package:truee_balance_app/core/widgets/images/cache_network_image/image_widget.dart';
import 'package:truee_balance_app/features/user/add%20session/bloc/cubit/add_session_cubit.dart';

class AddSessionScreen extends StatelessWidget {
  const AddSessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddSessionCubit>();

    return Scaffold(
      backgroundColor: AppColors.primaryColor900,
      appBar: CustomBasicAppBar(
        title: 'booking'.tr(),
        backgroundColor: AppColors.primaryColor900,
        svgAsset: 'assets/images/svg/bg_image.svg',
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (cubit.currentStep == 1 || cubit.currentStep == 2) {
              cubit.previousStep();
            } else {
              Navigator.pop(context);
            }
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
            Text(
              'bookingSession'.tr(),
              style: Styles.highlightAccent,
            ),
            12.verticalSpace,
            BlocBuilder<AddSessionCubit, AddSessionState>(
              buildWhen: (previous, current) => current is ChangeStepState,
              builder: (context, state) {
                return Row(
                  children: List.generate(3, (index) {
                    return Expanded(
                      child: Container(
                        height: 4.sp,
                        margin: EdgeInsets.symmetric(horizontal: 2.w),
                        decoration: BoxDecoration(
                          color: index <= cubit.currentStep
                              ? AppColors.secondaryColor500
                              : const Color(0x0303031a).withAlpha(25),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
            12.verticalSpace,
            Expanded(
              child: BlocBuilder<AddSessionCubit, AddSessionState>(
                buildWhen: (previous, current) => current is ChangeStepState,
                builder: (context, state) {
                  return SingleChildScrollView(
                    child: (cubit.currentStep == 0)
                        ? DetailsWidget(cubit: cubit)
                        : (cubit.currentStep == 1)
                            ? SelectBookingWidget(cubit: cubit)
                            : Column(
                                spacing: 10.sp,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.all(12.sp),
                                    decoration: BoxDecoration(
                                      color: AppColors.neutralColor100,
                                      borderRadius: BorderRadius.circular(12.r),
                                      border: Border.all(
                                        color: AppColors.neutralColor1000
                                            .withAlpha(20),
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
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12.r),
                                          child: CacheNetworkImagesWidget(
                                            image: cubit.treatmentPlanDetail
                                                .therapist.image,
                                            width: 55.w,
                                            height: 55.h,
                                          ),
                                        ),
                                        12.horizontalSpace,
                                        Expanded(
                                          child: Column(
                                            spacing: 4.h,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                cubit.treatmentPlanDetail
                                                    .therapist.name,
                                                style:
                                                    Styles.contentBold.copyWith(
                                                  color: AppColors
                                                      .neutralColor1000,
                                                ),
                                              ),
                                              Text(
                                                cubit.treatmentPlanDetail
                                                    .therapist.specialization,
                                                style: Styles.footnoteEmphasis
                                                    .copyWith(
                                                  color:
                                                      AppColors.neutralColor600,
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.all(12.sp),
                                    decoration: BoxDecoration(
                                      color: AppColors.neutralColor100,
                                      borderRadius: BorderRadius.circular(12.r),
                                      border: Border.all(
                                        color: AppColors.neutralColor1000
                                            .withAlpha(20),
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
                                      spacing: 12.sp,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        _buildRow(
                                            "Total Of Session",
                                            cubit.treatmentPlanDetail
                                                .totalSessions
                                                .toString()),

                                        _buildRow("Treatment Name",
                                            cubit.treatmentPlanDetail.name),

                                        const Text(
                                          "Notes",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        Text(
                                          cubit.treatmentPlanDetail
                                                  .description ??
                                              "",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        // SizedBox(height: 150.sp)
                                      ],
                                    ),
                                  ),
                                  ListView.separated(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: cubit
                                        .treatmentPlanDetail.sessions.length,
                                    separatorBuilder: (context, index) =>
                                        SizedBox(height: 12.h),
                                    itemBuilder: (context, index) {
                                      return Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.all(12.sp),
                                        decoration: BoxDecoration(
                                          color: AppColors.neutralColor100,
                                          borderRadius:
                                              BorderRadius.circular(12.r),
                                          border: Border.all(
                                            color: AppColors.neutralColor1000
                                                .withAlpha(20),
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
                                            _buildRow(
                                                "Session${index + 1}", ""),
                                            _buildRow(
                                                "data",
                                                cubit.treatmentPlanDetail
                                                    .sessions[index].date),
                                            _buildRow(
                                                "time",
                                                cubit.treatmentPlanDetail
                                                    .sessions[index].time),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                  ListView.separated(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: cubit.selectedItems.length,
                                    separatorBuilder: (context, index) =>
                                        SizedBox(height: 12.h),
                                    itemBuilder: (context, index) {
                                      final selectedSession =
                                          cubit.selectedItems.length > index
                                              ? cubit.selectedItems[index]
                                              : null;

                                      return Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.all(12.sp),
                                        decoration: BoxDecoration(
                                          color: AppColors.neutralColor100,
                                          borderRadius:
                                              BorderRadius.circular(12.r),
                                          border: Border.all(
                                            color: AppColors.neutralColor1000
                                                .withAlpha(20),
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
                                            Row(
                                              children: [
                                                _buildRow(
                                                  "Session ${index + 1 + cubit.treatmentPlanDetail.sessions.length}",
                                                  "",
                                                ),
                                              ],
                                            ),
                                            if (selectedSession != null) ...[
                                              Container(
                                                width: double.infinity,
                                                padding: EdgeInsets.all(12.sp),
                                                decoration: BoxDecoration(
                                                  color:
                                                      AppColors.neutralColor100,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.r),
                                                  border: Border.all(
                                                    color: AppColors
                                                        .neutralColor1000
                                                        .withAlpha(20),
                                                    width: 1.w,
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      offset: Offset(0, 2.h),
                                                      blurRadius: 8.r,
                                                      color: Colors.black
                                                          .withAlpha(20),
                                                    ),
                                                  ],
                                                ),
                                                child: _buildRow("session Date",
                                                    "${selectedSession.date} "),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                padding: EdgeInsets.all(12.sp),
                                                decoration: BoxDecoration(
                                                  color:
                                                      AppColors.neutralColor100,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.r),
                                                  border: Border.all(
                                                    color: AppColors
                                                        .neutralColor1000
                                                        .withAlpha(20),
                                                    width: 1.w,
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      offset: Offset(0, 2.h),
                                                      blurRadius: 8.r,
                                                      color: Colors.black
                                                          .withAlpha(20),
                                                    ),
                                                  ],
                                                ),
                                                child: _buildRow("session time",
                                                    "${selectedSession.time} "),
                                              )
                                            ]
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                  10.verticalSpace
                                ],
                              ),
                  );
                },
              ),
            ),
            BlocConsumer<AddSessionCubit, AddSessionState>(
              listener: (context, state) {
                if (state is AddSessionSuccess) {
                  customToast(
                      msg: "Session added successfully",
                      color: AppColors.greenColor200);
                  Navigator.pop(context, true);
                }
              },
              buildWhen: (previous, current) => current is ChangeStepState,
              builder: (context, state) {
                return CustomButtonWidget(
                  text: cubit.currentStep == 2 ? 'Booking Now' : 'Next',
                  onPressed: () {
                    if (cubit.currentStep == 0) {
                      cubit.nextStep();
                    } else if (cubit.currentStep == 1) {
                      if (cubit.selectedItems.isNotEmpty) {
                        cubit.nextStep();
                      } else {
                        customToast(
                            msg: "Please select at least one session.",
                            color: AppColors.redColor200);
                      }
                    } else {
                      cubit.addSession();
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SelectBookingWidget extends StatelessWidget {
  const SelectBookingWidget({
    super.key,
    required this.cubit,
  });

  final AddSessionCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.sp,
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cubit.treatmentPlanDetail.sessions.length,
          separatorBuilder: (context, index) => SizedBox(height: 12.h),
          itemBuilder: (context, index) {
            return Container(
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
                  _buildRow("Session${index + 1}", ""),
                  _buildRow(
                      "data", cubit.treatmentPlanDetail.sessions[index].date),
                  _buildRow(
                      "time", cubit.treatmentPlanDetail.sessions[index].time),
                ],
              ),
            );
          },
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cubit.treatmentPlanDetail.uncompletedSessions,
          separatorBuilder: (context, index) => SizedBox(height: 12.h),
          itemBuilder: (context, index) {
            final selectedSession = cubit.selectedItems.length > index
                ? cubit.selectedItems[index]
                : null;

            return InkWell(
              onTap: () async {
                if (selectedSession == null) {
                  await pickSession(context, cubit);
                }
              },
              child: Container(
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
                    Row(
                      children: [
                        _buildRow(
                          "Session ${index + 1 + cubit.treatmentPlanDetail.sessions.length}",
                          "",
                        ),
                        const Spacer(),
                        if (selectedSession == null)
                          Icon(
                            Icons.add,
                            color: AppColors.primaryColor900,
                          )
                        else
                          InkWell(
                            onTap: () {
                              cubit.removeSelectedItem(index);
                            },
                            child: Icon(
                              Icons.delete,
                              color: AppColors.primaryColor900,
                            ),
                          ),
                      ],
                    ),
                    if (selectedSession != null) ...[
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
                        child: _buildRow(
                            "session Date", "${selectedSession.date} "),
                      ),
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
                        child: _buildRow(
                            "session time", "${selectedSession.time} "),
                      )
                    ]
                  ],
                ),
              ),
            );
          },
        ),
        5.verticalSpace,
      ],
    );
  }
}

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({
    super.key,
    required this.cubit,
  });

  final AddSessionCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12.sp,
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
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: CacheNetworkImagesWidget(
                  image: cubit.treatmentPlanDetail.therapist.image,
                  width: 55.w,
                  height: 55.h,
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: Column(
                  spacing: 4.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cubit.treatmentPlanDetail.therapist.name,
                      style: Styles.contentBold.copyWith(
                        color: AppColors.neutralColor1000,
                      ),
                    ),
                    Text(
                      cubit.treatmentPlanDetail.therapist.specialization,
                      style: Styles.footnoteEmphasis.copyWith(
                        color: AppColors.neutralColor600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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
            spacing: 12.sp,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildRow("Treatment Name", cubit.treatmentPlanDetail.name),
              _buildRow("Total Of Session",
                  cubit.treatmentPlanDetail.totalSessions.toString()),
              _buildRow("Booking Is Complete",
                  cubit.treatmentPlanDetail.completedSessions.toString()),
              _buildRow("Remaining Reservations Are Required",
                  cubit.treatmentPlanDetail.uncompletedSessions.toString()),
              _buildRow("Type Of Treatment", cubit.treatmentPlanDetail.type),
              const Text(
                "Notes",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              Text(
                cubit.treatmentPlanDetail.description ?? "",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 150.sp)
            ],
          ),
        ),
      ],
    );
  }
}

Widget _buildRow(String label, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        label,
        style: Styles.contentEmphasis.copyWith(
          fontSize: 14.sp,
          color: AppColors.neutralColor600,
        ),
      ),
      Text(
        value,
        style: Styles.contentEmphasis.copyWith(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.neutralColor1000,
        ),
      ),
    ],
  );
}

Future<void> pickSession(BuildContext context, AddSessionCubit cubit) async {
  final availableAppointments = cubit.treatmentPlanDetail.availableAppointments;

  final sortedDates = availableAppointments
      .map((a) => DateFormat('dd-MM-yyyy').parse(a.day))
      .where((date) => !date.isBefore(DateTime.now()))
      .toList()
    ..sort();

  if (sortedDates.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("No future available sessions."),
        backgroundColor: Colors.red,
      ),
    );
    return;
  }

  final firstAvailableDate = sortedDates.first;

  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: firstAvailableDate,
    firstDate: DateTime.now(),
    lastDate: DateTime.now().add(const Duration(days: 30)),
    selectableDayPredicate: (date) {
      final formatted = DateFormat('dd-MM-yyyy').format(date);
      return availableAppointments.any((a) => a.day == formatted);
    },
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: AppColors.primaryColor900,
            onPrimary: Colors.white,
            surface: Colors.white,
            onSurface: AppColors.neutralColor900,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: AppColors.primaryColor900,
            ),
          ),
          dialogTheme: const DialogThemeData(backgroundColor: Colors.white),
        ),
        child: child!,
      );
    },
  );

  if (pickedDate == null) return;

  final formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
  final times =
      availableAppointments.firstWhere((a) => a.day == formattedDate).slots;

  String? selectedTime = await showDialog<String>(
    context: context,
    builder: (_) => SimpleDialog(
      backgroundColor: Colors.white,
      title: const Text("Select Time"),
      children: times
          .map(
            (time) => SimpleDialogOption(
              onPressed: () => Navigator.pop(context, time),
              child: Text(time),
            ),
          )
          .toList(),
    ),
  );

  if (selectedTime == null) return;

  if (cubit.selectedItems
      .any((item) => item.date == formattedDate && item.time == selectedTime)) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("This session is already selected."),
        backgroundColor: Colors.orange,
      ),
    );
    return;
  }

  cubit.addSelectedItem(
    SelecteItem(date: formattedDate, time: selectedTime),
  );
}
