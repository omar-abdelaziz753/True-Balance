import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/features/user/my_booking/bloc/mybook_cubit.dart';
import 'package:truee_balance_app/features/user/my_booking/presentation/screens/booking_details_screen.dart';
import 'package:truee_balance_app/features/user/my_booking/presentation/widgets/custom_booking_container_widget.dart';

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
          return Scaffold(
            backgroundColor: AppColors.primaryColor900,
            appBar: CustomBasicAppBar(
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
            body: Skeletonizer(
              enabled: true,
              child: Container(
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
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemCount: 10,
                              separatorBuilder: (context, index) =>
                                  18.verticalSpace,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () => context
                                      .pushNamed(Routes.bookingDetailsScreen),
                                  child: const CustomBookingContainerWidget(
                                      date: "2024-10-10",
                                      time: "4:00 pm",
                                      status: "pending"),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        }
        return Scaffold(
          backgroundColor: AppColors.primaryColor900,
          appBar: CustomBasicAppBar(
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
                  child: cubit.consultationsResponse?.data.data.isEmpty == true
                      ? Center(child: Text('noBooking'.tr()))
                      : Column(
                          children: [
                            Expanded(
                              child: ListView.separated(
                                controller: cubit.consultationsScrollController,
                                shrinkWrap: true,
                                itemCount: cubit
                                    .consultationsResponse!.data.data.length,
                                separatorBuilder: (context, index) =>
                                    18.verticalSpace,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              BlocProvider.value(
                                            value: cubit,
                                            child: BookingDetailsScreen(
                                              consultation: cubit
                                                  .consultationsResponse!
                                                  .data
                                                  .data[index],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    child: CustomBookingContainerWidget(
                                      date: cubit.consultationsResponse!.data
                                          .data[index].date,
                                      time: cubit.consultationsResponse!.data
                                          .data[index].time,
                                      status: cubit.consultationsResponse!.data
                                          .data[index].status,
                                    ),
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
        );
      },
    );
  }
}
