import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/features/user/sessions/bloc/cubit/sessions_cubit.dart';
import 'package:truee_balance_app/features/user/sessions/presentation/widgets/my_sessions_for_all_therapist_widgets.dart';
import 'package:truee_balance_app/features/user/sessions/presentation/widgets/skelton_mysessions_for_therapist.dart';

class AllTherapistScreen extends StatelessWidget {
  const AllTherapistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SessionsCubit>();

    return BlocBuilder<SessionsCubit, SessionsState>(
      buildWhen: (previous, current) =>
          current is GetAllTherapistFailureState ||
          current is GetAllTherapistSuccessState ||
          current is GetAllTherapistFailureState,
      builder: (context, state) {
        if (state is GetAllTherapistLoadingState) {
          return const SkeltonMySessionsForTherapist();
        }
        return Scaffold(
          backgroundColor: AppColors.primaryColor900,
          appBar: CustomBasicAppBar(
            title: 'mySessions'.tr(),
            backgroundColor: AppColors.primaryColor900,
            svgAsset: 'assets/images/svg/bg_image.svg',
          ),
          body: BlocBuilder<SessionsCubit, SessionsState>(
            builder: (context, state) {
              return cubit.allTherapistDataModel == null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(18.sp),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.r),
                          topRight: Radius.circular(12.r),
                        ),
                      ),
                      child: cubit.allTherapistDataModel?.data?.data?.isEmpty ==
                              true
                          ? Center(
                              child: Text('noTherapistAvailable'.tr()),
                            )
                          : ListView.separated(
                              itemCount: cubit.allTherapistDataModel?.data?.data
                                      ?.length ??
                                  0,
                              separatorBuilder: (context, index) =>
                                  18.verticalSpace,
                              itemBuilder: (context, index) {
                                final data = cubit
                                    .allTherapistDataModel?.data?.data?[index];
                                return MySessionsForAllTherapistWidgets(
                                    data: data!);
                              },
                            ),
                    );
            },
          ),
        );
      },
    );
  }
}
