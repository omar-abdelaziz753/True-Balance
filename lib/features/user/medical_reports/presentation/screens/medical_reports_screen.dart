import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/helper_functions/date_formate.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/features/user/medical_reports/bloc/cubit/reports_cubit.dart';
import 'package:truee_balance_app/features/user/medical_reports/presentation/widgets/medical_report_item_widget.dart';
import 'package:truee_balance_app/features/user/medical_reports/presentation/widgets/medical_reports_skeleton_widget.dart';

class MedicalReportsScreen extends StatelessWidget {
  const MedicalReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ReportsCubit>();
    return BlocBuilder<ReportsCubit, ReportsState>(
      buildWhen: (previous, current) =>
          current is ReportsSuccess ||
          current is ReportsError ||
          current is ReportsLoading,
      builder: (context, state) {
        if (state is ReportsLoading) {
          return const MediaclReportSkeletonWidget();
        }
        return Scaffold(
          backgroundColor: AppColors.neutralColor900,
          appBar: CustomBasicAppBar(
            leading: BackButton(
              color: AppColors.neutralColor100,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: 'medicalReports'.tr(),
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
                        child: cubit.reportsModel!.data.isEmpty
                            ? Center(
                                child: Text(
                                  "noReportsAvailable".tr(),
                                  style: Styles.contentEmphasis.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                    color: AppColors.neutralColor600,
                                  ),
                                ),
                              )
                            : ListView.separated(
                                itemCount: cubit.reportsModel!.data.length,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return 16.verticalSpace;
                                },
                                itemBuilder: (BuildContext context, int index) {
                                  return MedicalReportItemWidget(
                                      item: cubit.reportsModel!.data[index].file,
                                    date: formatDate(cubit.reportsModel!.data[index].createdAt),
                                    time: formatTime(cubit.reportsModel!.data[index].createdAt),
                                  );
                                },
                              ),
                      )
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
