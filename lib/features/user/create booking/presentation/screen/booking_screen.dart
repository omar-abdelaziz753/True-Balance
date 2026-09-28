import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:true_balance_app/core/extensions/navigation_extension.dart';
import 'package:true_balance_app/core/helper_functions/flutter_toast.dart';
import 'package:true_balance_app/core/routing/routes_name.dart';
import 'package:true_balance_app/core/themes/app_colors.dart';
import 'package:true_balance_app/core/utils/app_constants.dart';
import 'package:true_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:true_balance_app/core/widgets/bottom_sheet/show_booking_sheet.dart';
import 'package:true_balance_app/features/payment/presentation/screens/payment_screen.dart';
import 'package:true_balance_app/features/user/create%20booking/bloc/cubit/create_booking_cubit.dart';
import 'package:true_balance_app/features/user/create%20booking/presentation/widgets/booking_summary_card.dart';
import 'package:true_balance_app/features/user/create%20booking/presentation/widgets/enhanced_session_selector.dart';
import 'package:true_balance_app/features/user/doctor_details/data/model/doctor_details_model.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key, required this.doctorModel});
  final DoctorModelDetails doctorModel;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateBookingCubit>();
    return Scaffold(
      backgroundColor: AppColors.neutralColor100,
      appBar: CustomBasicAppBar(
        title: 'booking'.tr(),
        backgroundColor: AppColors.primaryColor900,
        svgAsset: 'assets/images/svg/bg_image.svg',
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            if (cubit.currentStep == 1) {
              cubit.previousStep();
            } else {
              Navigator.pop(context);
            }
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            _buildEnhancedStepIndicator(context),
            16.verticalSpace,
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: BlocBuilder<CreateBookingCubit, CreateBookingState>(
                  buildWhen: (previous, current) => current is ChangeStepState,
                  builder: (context, state) {
                    if (cubit.currentStep == 0) {
                      return EnhancedSessionSelector(doctor: doctorModel);
                    } else {
                      return BookingSummaryCard(doctor: doctorModel);
                    }
                  },
                ),
              ),
            ),
            16.verticalSpace,
            BlocConsumer<CreateBookingCubit, CreateBookingState>(
              listener: (context, state) {
                if (state is BookingPaymentRequired) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PaymentScreen(
                        bookingId: state.consultationId,
                        amount: state.amount,
                        currency: 'SAR',
                        onPaymentSuccess: () {
                          showbookingBottomSheet(
                            context,
                            title1: "congratulation".tr(),
                            title2: "paymentSuccess".tr(),
                            description: "youCanCheckYourBookings".tr(),
                            buttonText: "bookings".tr(),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                              AppConstants.userMainLayoutInitialScreenIndex = 3;
                              AppConstants.navigatorKey.currentContext
                                  ?.pushNamedAndRemoveUntil(
                                      Routes.mainLayoutScreen);
                            },
                          );
                        },
                        onPaymentFailed: () {
                          customToast(
                              msg: "paymentFailed".tr(),
                              color: AppColors.redColor200);
                        },
                        onPaymentCancelled: () {
                          customToast(
                              msg: "paymentCancelled".tr(),
                              color: AppColors.redColor200);
                        },
                      ),
                    ),
                  );
                } else if (state is BookingSuccessState) {
                  showbookingBottomSheet(
                    context,
                    title1: "congratulation".tr(),
                    title2: "bookingConfirmed".tr(),
                    description: "youCanCheckYourBookings".tr(),
                    buttonText: "bookings".tr(),
                    onPressed: () {
                      Navigator.pop(context);
                      AppConstants.userMainLayoutInitialScreenIndex = 3;
                      AppConstants.navigatorKey.currentContext
                          ?.pushNamedAndRemoveUntil(Routes.mainLayoutScreen);
                    },
                  );
                } else if (state is BookingFailureState) {
                  customToast(
                      msg: state.message ?? "bookingFailed".tr(),
                      color: AppColors.redColor200);
                }
              },
              buildWhen: (previous, current) =>
                  current is ChangeStepState ||
                  current is BookingLoadingState ||
                  current is BookingSuccessState ||
                  current is BookingFailureState ||
                  current is BookingPaymentRequired,
              builder: (context, state) {
                final cubit = context.read<CreateBookingCubit>();
                final canProceed = (cubit.currentStep == 0
                        ? cubit.selectedTimeIndex != -1
                        : true) &&
                    state is! BookingLoadingState;

                return Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: canProceed
                            ? () {
                                if (cubit.currentStep == 0) {
                                  cubit.nextStep();
                                } else {
                                  cubit.bookSelectedSession();
                                }
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor900,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r)),
                          disabledBackgroundColor: AppColors.neutralColor300,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                                cubit.currentStep == 0
                                    ? Icons.arrow_forward
                                    : Icons.check,
                                size: 20.sp),
                            8.horizontalSpace,
                            Text(
                              cubit.currentStep == 0
                                  ? 'reviewBooking'.tr()
                                  : 'confirmBooking'.tr(),
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (cubit.currentStep == 1)
                      TextButton(
                        onPressed: () => cubit.previousStep(),
                        child: Text('back'.tr(),
                            style: TextStyle(color: AppColors.neutralColor500)),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEnhancedStepIndicator(BuildContext context) {
    final cubit = context.watch<CreateBookingCubit>();
    final steps = [
      {'icon': Icons.calendar_today, 'label': 'selectDateTime'.tr()},
      {'icon': Icons.checklist, 'label': 'reviewBooking'.tr()},
    ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withAlpha(13),
              blurRadius: 10,
              offset: const Offset(0, 2))
        ],
      ),
      child: Row(
        children: List.generate(steps.length, (index) {
          final isCompleted = index < cubit.currentStep;
          final isActive = index == cubit.currentStep;

          return Expanded(
            child: Row(
              children: [
                Container(
                  width: 32.w,
                  height: 32.w,
                  decoration: BoxDecoration(
                    color: isCompleted
                        ? AppColors.primaryColor900
                        : (isActive
                            ? AppColors.primaryColor900
                            : AppColors.neutralColor200),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: isCompleted
                        ? Icon(Icons.check, size: 16.sp, color: Colors.white)
                        : Text('${index + 1}',
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: isActive
                                    ? Colors.white
                                    : AppColors.neutralColor500)),
                  ),
                ),
                8.horizontalSpace,
                Expanded(
                  child: Text(
                    steps[index]['label'] as String,
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight:
                          isActive ? FontWeight.w600 : FontWeight.normal,
                      color: isActive
                          ? AppColors.primaryColor900
                          : AppColors.neutralColor500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (index < steps.length - 1)
                  Expanded(
                    child: Container(
                      height: 2.h,
                      margin: EdgeInsets.symmetric(horizontal: 8.w),
                      decoration: BoxDecoration(
                        color: isCompleted
                            ? AppColors.primaryColor900
                            : AppColors.neutralColor200,
                        borderRadius: BorderRadius.circular(1.r),
                      ),
                    ),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
