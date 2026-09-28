import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:true_balance_app/core/themes/app_colors.dart';
import 'package:true_balance_app/core/utils/app_constants.dart';
import 'package:true_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:true_balance_app/core/widgets/please_login_button/please_login_button.dart';
import 'package:true_balance_app/features/user/my_booking/bloc/mybook_cubit.dart';
import 'package:true_balance_app/features/user/my_booking/presentation/screens/booking_details_screen.dart';
import 'package:true_balance_app/features/user/my_booking/presentation/widgets/consultation_card_widget.dart';

import '../widgets/filter_bottom_sheet.dart';
import '../widgets/skelton_widget.dart';

class MyBookingScreen extends StatelessWidget {
  const MyBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MybookCubit>();
    return BlocBuilder<MybookCubit, MybookState>(
      buildWhen: (previous, current) =>
          current is ConsultationsSuccess ||
          current is ConsultationsLoading ||
          current is ConsultationsError,
      builder: (context, state) {
        if (state is ConsultationsLoading) {
          return const SkeltonWidget();
        }
        return Scaffold(
          backgroundColor: AppColors.primaryColor900,
          appBar: CustomBasicAppBar(
            actions: AppConstants.userToken == null
                ? []
                : [
                    IconButton(
                      icon: const Icon(Icons.filter_list, color: Colors.white),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16.r)),
                          ),
                          builder: (context) => FilterBottomSheet(cubit: cubit),
                        );
                      },
                    ),
                  ],
            leading: Navigator.canPop(context)
                ? BackButton(
                    color: AppColors.neutralColor100,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                : null,
            title: 'myBooking'.tr(),
            backgroundColor: AppColors.primaryColor900,
            svgAsset: 'assets/images/svg/bg_image.svg',
          ),
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFF2F2F7),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: AppConstants.userToken != null
                      ? _buildContent(context, cubit)
                      : const PleaseLoginButtom(),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, MybookCubit cubit) {
    final consultations = cubit.consultationsResponse?.data.data ?? [];
    final isEmpty = consultations.isEmpty;

    if (isEmpty) {
      return _buildEmptyState(context);
    }

    return Column(
      children: [
        _buildSummaryHeader(cubit),
        Expanded(
          child: ListView.separated(
            controller: cubit.consultationsScrollController,
            padding: EdgeInsets.all(16.w),
            itemCount: consultations.length,
            separatorBuilder: (context, index) => 12.verticalSpace,
            itemBuilder: (context, index) {
              return ConsultationCardWidget(
                consultation: consultations[index],
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BlocProvider.value(
                        value: cubit,
                        child: BookingDetailsScreen(
                          consultation: consultations[index],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        BlocBuilder<MybookCubit, MybookState>(
          buildWhen: (previous, current) =>
              current is ConsultationsLoadingMore ||
              current is ConsultationsSuccess,
          builder: (context, state) {
            if (state is ConsultationsLoadingMore) {
              return Padding(
                padding: EdgeInsets.all(16.w),
                child: const Center(child: CircularProgressIndicator()),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }

  Widget _buildSummaryHeader(MybookCubit cubit) {
    final consultations = cubit.consultationsResponse?.data.data ?? [];
    final pending = consultations.where((c) => c.status == 'pending').length;
    final confirmed =
        consultations.where((c) => c.status == 'confirmed').length;
    final completed =
        consultations.where((c) => c.status == 'completed').length;

    return Container(
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem('pending'.tr(), pending, AppColors.primaryColor900),
          _buildDivider(),
          _buildStatItem(
              'confirmed'.tr(), confirmed, AppColors.primaryColor900),
          _buildDivider(),
          _buildStatItem(
              'completed'.tr(), completed, AppColors.primaryColor900),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, int count, Color color) {
    return Column(
      children: [
        Text(
          count.toString(),
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        4.verticalSpace,
        Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            color: const Color(0xFF8E8E93),
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 1,
      height: 40.h,
      color: const Color(0xFFE5E5EA),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(24.w),
              decoration: const BoxDecoration(
                color: Color(0xFFF8F8F8),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.calendar_today_outlined,
                size: 48.sp,
                color: const Color(0xFFC7C7CC),
              ),
            ),
            24.verticalSpace,
            Text(
              'noBooking'.tr(),
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1C1C1E),
              ),
            ),
            8.verticalSpace,
            Text(
              'bookYourFirstConsultation'.tr(),
              style: TextStyle(
                fontSize: 14.sp,
                color: const Color(0xFF8E8E93),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
