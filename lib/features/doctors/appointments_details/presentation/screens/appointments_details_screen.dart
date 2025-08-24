import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/features/doctors/appointments/data/model/consultation_users_model.dart';
import 'package:truee_balance_app/features/doctors/appointments_details/bloc/cubit/appointments_details_cubit.dart';
import 'package:truee_balance_app/features/doctors/appointments_details/presentation/widgets/list_widget.dart';
import 'package:truee_balance_app/features/doctors/appointments_details/presentation/widgets/skeltoin_widget.dart';
import 'package:truee_balance_app/features/doctors/appointments_details/presentation/widgets/total_appoimntes_widget.dart';
import 'package:truee_balance_app/features/doctors/appointments_details/presentation/widgets/user_widget.dart';

class AppointmentsDetailsScreen extends StatelessWidget {
  const AppointmentsDetailsScreen({super.key, required this.userData});
  final UserData userData;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppointmentsDetailsCubit>();

    return BlocBuilder<AppointmentsDetailsCubit, AppointmentsDetailsState>(
      buildWhen: (previous, current) =>
          current is AppointmentsDetailsSuccess ||
          current is AppointmentsDetailsLoading,
      builder: (context, state) {
        if (state is AppointmentsDetailsLoading) {
          return SkltoinWidget(userData: userData, cubit: cubit);
        }
        return Scaffold(
          backgroundColor: AppColors.primaryColor900,
          appBar: CustomBasicAppBar(
            leading: BackButton(
              color: AppColors.neutralColor100,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: 'appointments Details',
            backgroundColor: AppColors.primaryColor900,
            svgAsset: 'assets/images/svg/bg_image.svg',
          ),
          body: Stack(
            children: [
              Container(
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
                          UserWidget(userData: userData, cubit: cubit),
                          18.verticalSpace,
                          TotalApmointesWIdget(
                              cubit: cubit, userData: userData),
                          18.verticalSpace,
                          ListWidget(cubit: cubit),
                          BlocBuilder<AppointmentsDetailsCubit,
                              AppointmentsDetailsState>(
                            buildWhen: (previous, current) =>
                                current is AppointmentsDetailsSuccess ||
                                current is AppointmentsDetailsLoadingMore,
                            builder: (context, state) {
                              if (state is AppointmentsDetailsLoadingMore) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
