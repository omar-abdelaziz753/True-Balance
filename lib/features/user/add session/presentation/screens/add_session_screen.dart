import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/helper_functions/flutter_toast.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';
import 'package:truee_balance_app/features/user/add%20session/bloc/cubit/add_session_cubit.dart';
import 'package:truee_balance_app/features/user/add%20session/presentation/widgets/details_widget.dart';
import 'package:truee_balance_app/features/user/add%20session/presentation/widgets/rewview_widget.dart';
import 'package:truee_balance_app/features/user/add%20session/presentation/widgets/select_booking_widget.dart';

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
                            : RewviewWidget(cubit: cubit),
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


