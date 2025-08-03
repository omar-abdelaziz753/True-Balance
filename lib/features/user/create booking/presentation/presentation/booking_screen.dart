import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';
import 'package:truee_balance_app/features/user/create%20booking/bloc/cubit/create_booking_cubit.dart';
import 'package:truee_balance_app/features/user/create%20booking/presentation/widgets/bookind_details_widget.dart';
import 'package:truee_balance_app/features/user/create%20booking/presentation/widgets/form_widget.dart';
import 'package:truee_balance_app/features/user/create%20booking/presentation/widgets/session_selector.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateBookingCubit>();
    return Scaffold(
        backgroundColor: AppColors.primaryColor900,
        appBar: CustomBasicAppBar(
          title: 'booking'.tr(),
          leading: BackButton(
            color: AppColors.neutralColor100,
            onPressed: () {},
          ),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'bookingSession'.tr(),
                style: Styles.highlightAccent,
              ),
              12.verticalSpace,
              Expanded(
                child: SingleChildScrollView(
                  child: BlocBuilder<CreateBookingCubit, CreateBookingState>(
                    buildWhen: (previous, current) =>
                        current is ChangeStepState,
                    builder: (context, state) {
                      return Column(
                        spacing: 12.sp,
                        children: [
                          Row(
                            children: List.generate(3, (index) {
                              return Expanded(
                                child: Container(
                                  height: 4.sp,
                                  margin: EdgeInsets.only(
                                    left: index == 0 ? 0 : 2.sp,
                                    right: index == 2 ? 0 : 2.sp,
                                  ),
                                  decoration: BoxDecoration(
                                    color: index <= cubit.currentStep
                                        ? AppColors.secondaryColor500
                                        : const Color(0x0303031a)
                                            .withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              );
                            }),
                          ),
                          if (cubit.currentStep == 0)
                            const FormWidget()
                          else if (cubit.currentStep == 1)
                            const SelectDateAndTimeWidget()
                          else
                            const BookingDetailsWidget(),
                        ],
                      );
                    },
                  ),
                ),
              ),
              BlocBuilder<CreateBookingCubit, CreateBookingState>(
                buildWhen: (previous, current) => current is ChangeStepState,
                builder: (context, state) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 23.sp),
                    child: CustomButtonWidget(
                      text: cubit.currentStep == 2
                          ? 'bookingNow'.tr()
                          : 'next'.tr(),
                      onPressed: () {
                        cubit.nextStep();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ));

    //    Container(
    //     width: double.infinity,
    //     padding: EdgeInsets.all(18.sp),
    //     decoration: BoxDecoration(
    //       color: Colors.white,
    //       borderRadius: BorderRadius.only(
    //         topLeft: Radius.circular(12.r),
    //         topRight: Radius.circular(12.r),
    //       ),
    //     ),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text(
    //           'bookingSession'.tr(),
    //           style: Styles.highlightAccent,
    //         ),
    //         12.verticalSpace,
    //         BlocBuilder<CreateBookingCubit, CreateBookingState>(
    //           buildWhen: (previous, current) => current is ChangeStepState,
    //           builder: (context, state) {
    //             return Column(
    //               spacing: 12.sp,
    //               children: [
    //                 Row(
    //                   children: List.generate(3, (index) {
    //                     return Expanded(
    //                       child: Container(
    //                         height: 4.sp,
    //                         margin: EdgeInsets.only(
    //                           left: index == 0 ? 0 : 4 / 2,
    //                           right: index == -1 ? 0 : 4 / 2,
    //                         ),
    //                         decoration: BoxDecoration(
    //                           color: index <= cubit.currentStep
    //                               ? AppColors.secondaryColor500
    //                               : const Color(0x0303031a)
    //                                   .withValues(alpha: 0.1),
    //                           borderRadius: BorderRadius.circular(4),
    //                         ),
    //                       ),
    //                     );
    //                   }),
    //                 ),
    //                 if (cubit.currentStep == 0)
    //                   const FormWidget()
    //                 else if (cubit.currentStep == 1)
    //                   const SessionSelector()
    //                 else
    //                   const BookingDetailsWidget(),
    //               ],
    //             );
    //           },
    //         ),
    //         const Spacer(),
    //         BlocBuilder<CreateBookingCubit, CreateBookingState>(
    //           buildWhen: (previous, current) => current is ChangeStepState,
    //           builder: (context, state) {
    //             return CustomButtonWidget(
    //               text: cubit.currentStep == 2 ? 'Booking Now' : 'Next',
    //               onPressed: () {
    //                 cubit.nextStep();
    //               },
    //             );
    //           },
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
