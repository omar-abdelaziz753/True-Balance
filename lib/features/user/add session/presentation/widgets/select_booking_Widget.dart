import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/features/user/add%20session/bloc/cubit/add_session_cubit.dart';
import 'package:truee_balance_app/features/user/add%20session/presentation/widgets/details_row_widget.dart';
import 'package:truee_balance_app/features/user/add%20session/presentation/widgets/pick_session_widget.dart';

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
                  DetailsRowWidget(
                    label: "${"Session".tr()} ${index + 1}",
                    value: "",
                  ),
                  DetailsRowWidget(
                    label: "date".tr(),
                    value: cubit.treatmentPlanDetail.sessions[index].date,
                  ),
                  DetailsRowWidget(
                    label: "time".tr(),
                    value: cubit.treatmentPlanDetail.sessions[index].time,
                  ),
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
                        DetailsRowWidget(
                          label:
                              "Session ${index + 1 + cubit.treatmentPlanDetail.sessions.length}",
                          value: "",
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
                        child: DetailsRowWidget(
                          label: "session Date",
                          value: "${selectedSession.date} ",
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
                        child: DetailsRowWidget(
                          label: "session time",
                          value: "${selectedSession.time} ",
                        ),
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
