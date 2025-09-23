import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';
import 'package:truee_balance_app/features/user/my_booking/bloc/mybook_cubit.dart';
import 'package:truee_balance_app/features/user/my_booking/data/models/Consultations/consultations_response.dart';
import 'package:truee_balance_app/features/user/my_booking/presentation/widgets/custom_row_make_title_and_desc_widget.dart';
import 'package:truee_balance_app/features/user/my_booking/presentation/widgets/doctor_details_widget.dart';
import 'package:truee_balance_app/features/user/my_booking/presentation/widgets/show_rating_bottom_sheet_for_user_consultaion.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key, required this.consultation});

  final Consultation consultation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor900,
      appBar: CustomBasicAppBar(
        leading: BackButton(
          color: AppColors.neutralColor100,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: 'bookingDetails'.tr(),
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
                    spacing: 18.h,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(12.sp),
                        decoration: BoxDecoration(
                          color: AppColors.neutralColor100,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 2.h),
                              blurRadius: 8.r,
                              spreadRadius: 0,
                              color: Colors.black.withAlpha(20),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: AppColors.neutralColor1000.withAlpha(20),
                            width: 1.sp,
                          ),
                        ),
                        child: Column(
                          spacing: 12.h,
                          children: [
                            CustomRowMakeTitleAndDescWidget(
                              title: 'date'.tr(),
                              description: consultation.date,
                            ),
                            CustomRowMakeTitleAndDescWidget(
                              title: 'time'.tr(),
                              description: consultation.time,
                            ),
                          ],
                        ),
                      ),
                      DoctorDetailsWidgetBookingDetails(
                          consultation: consultation),
                      const Spacer(),

                      BlocBuilder<MybookCubit, MybookState>(
                        builder: (context, state) {
                          final cubit = context.watch<MybookCubit>();

                          if (consultation.rating == null &&
                              !cubit.hasRated &&
                              cubit.isPending != true) {
                            return CustomButtonWidget(
                              text: "addRating".tr(),
                              onPressed: () async {
                                final result =
                                await showRatingBottomSheetForUserConsultaion(
                                  context,
                                  consultation.id,
                                );

                                if (result) {
                                  cubit.updateHasRated(true);
                                }
                              },
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
      // bottomNavigationBar: BlocConsumer<MybookCubit, MybookState>(
      //   listener: (context, state) {
      //     if (state is DeleteConsultationSuccess) {
      //       context.pushNamedAndRemoveUntil(Routes.mainLayoutScreen, arguments: 3);
      //     }
      //   },
      //   builder: (context, state) {
      //     return Container(
      //       padding: EdgeInsets.all(18.sp),
      //       decoration: BoxDecoration(
      //           color: Colors.white,
      //           boxShadow: [
      //             BoxShadow(
      //               offset: Offset(0, -2.h),
      //               blurRadius: 8.r,
      //               spreadRadius: 0,
      //               color: Colors.black.withAlpha(20),
      //             ),
      //           ],
      //           borderRadius: BorderRadius.only(
      //
      //           )),
      //       child: CustomButtonWidget(
      //         text: 'Cancel'.tr(),
      //         onPressed: () {
      //           context.read<MybookCubit>().deleteConsultation(
      //               id: consultation.id);
      //         },
      //         color: AppColors.redColor200,
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
