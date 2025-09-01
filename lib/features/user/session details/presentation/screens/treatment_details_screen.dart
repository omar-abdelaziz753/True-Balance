import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';
import 'package:truee_balance_app/features/user/session%20details/bloc/cubit/session_details_cubit.dart';
import 'package:truee_balance_app/features/user/session%20details/presentation/widgets/row_treatment_plan_details_widget.dart';
import 'package:truee_balance_app/features/user/session%20details/presentation/widgets/see_details_widget.dart';
import 'package:truee_balance_app/features/user/session%20details/presentation/widgets/skeletonizer_treatmen_details_widget.dart';
import 'package:truee_balance_app/features/user/session%20details/presentation/widgets/total_of_sessions_and_type_of_treatment_details_widget.dart';

class TreatmentDetailsScreen extends StatelessWidget {
  const TreatmentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SessionDetailsCubit>();
    return BlocBuilder<SessionDetailsCubit, SessionDetailsState>(
      buildWhen: (previous, current) =>
          previous is GetByTherapistDetailFailureState ||
          current is GetByTherapistDetailSuccessState ||
          current is GetByTherapistDetailLoadingState,
      builder: (context, state) {
        if (state is GetByTherapistDetailLoadingState) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              backgroundColor: AppColors.primaryColor900,
              appBar: CustomBasicAppBar(
                leading: BackButton(
                  color: AppColors.neutralColor100,
                ),
                title: 'treatmentname'.tr(),
                backgroundColor: AppColors.primaryColor900,
                svgAsset: 'assets/images/svg/bg_image.svg',
              ),
              body: const SkeletonizerTreatmentDetailsWidget(),
            ),
          );
        }
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: AppColors.primaryColor900,
            appBar: CustomBasicAppBar(
              leading: BackButton(
                color: AppColors.neutralColor100,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: cubit.treatmentPlanDetail?.name ?? "",
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
                  const RowtreatmentPlanDetailsWidget(),
                  18.verticalSpace,
                  const TotalofSessionsAndTypeOfTreatmentDetailsWidget(),
                  18.verticalSpace,
                  TabBar(
                    unselectedLabelColor: AppColors.neutralColor600,
                    labelColor: AppColors.primaryColor800,
                    indicatorColor: AppColors.primaryColor800,
                    dividerColor: AppColors.neutralColor300,
                    automaticIndicatorColorAdjustment: true,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [
                      Tab(text: 'Pending'.tr()),
                      Tab(text: 'Completed'.tr()),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        ListView.separated(
                            padding: EdgeInsets.all(12.sp),
                            itemBuilder: (context, index) => SeeDetailsWidget(
                                  session: cubit.upcomingSessions[index],
                                ),
                            separatorBuilder: (context, index) =>
                                18.verticalSpace,
                            itemCount: cubit.upcomingSessions.length),
                        ListView.separated(
                            itemBuilder: (context, index) => SeeDetailsWidget(
                                  session: cubit.completedSessions[index],
                                ),
                            separatorBuilder: (context, index) =>
                                18.verticalSpace,
                            itemCount: cubit.completedSessions.length),
                      ],
                    ),
                  ),
                  if (cubit.treatmentPlanDetail!.numberOfSessions !=
                      cubit.treatmentPlanDetail!.sessions.length)
                    if (cubit
                        .treatmentPlanDetail!.availableAppointments.isNotEmpty)
                      CustomButtonWidget(
                        onPressed: () {
                          context
                              .pushNamed(Routes.addSessionScreen,
                                  arguments: cubit.treatmentPlanDetail)
                              .then(
                            (v) {
                              if (v != null) {
                                cubit.treatmentPlansdetails(
                                    therapistId: cubit.treatmentPlanDetail!.id);
                              }
                            },
                          );
                        },
                        text: 'bookNewSession'.tr(),
                      ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
