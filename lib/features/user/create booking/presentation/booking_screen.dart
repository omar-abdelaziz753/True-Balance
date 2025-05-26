import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/assets.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';
import 'package:truee_balance_app/core/widgets/drop_down/custom_drop_down_widget.dart';
import 'package:truee_balance_app/features/user/create%20booking/bloc/cubit/create_booking_cubit.dart';
import 'package:truee_balance_app/features/user/my_booking/widgets/custom_row_make_title_and_desc_widget.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateBookingCubit>();
    return Scaffold(
      backgroundColor: AppColors.primaryColor900,
      appBar: CustomBasicAppBar(
        title: 'Booking',
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
              'Booking Session',
              style: Styles.highlightAccent,
            ),
            12.verticalSpace,
            BlocBuilder<CreateBookingCubit, CreateBookingState>(
              buildWhen: (previous, current) => current is ChangeStepState,
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
                              left: index == 0 ? 0 : 4 / 2,
                              right: index == -1 ? 0 : 4 / 2,
                            ),
                            decoration: BoxDecoration(
                              color: index <= cubit.currentStep
                                  ? AppColors.secondaryColor500
                                  : const Color(0x0303031a)
                                      .withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        );
                      }),
                    ),
                    if (cubit.currentStep == 0)
                      const FormWidget()
                    else if (cubit.currentStep == 1)
                      const SessionSelector()
                    else
                      const BookingDetailsWidget(),
                  ],
                );
              },
            ),
            const Spacer(),
            BlocBuilder<CreateBookingCubit, CreateBookingState>(
              buildWhen: (previous, current) => current is ChangeStepState,
              builder: (context, state) {
                return CustomButtonWidget(
                  text: cubit.currentStep == 2 ? 'Booking Now' : 'Next',
                  onPressed: () {
                    cubit.nextStep();
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

class FormWidget extends StatelessWidget {
  const FormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          18.verticalSpace,
          Text(
            "Service type",
            style: Styles.highlightAccent,
          ),
          8.verticalSpace,
          const CustomDropdownButtonWidget(
            hint: 'selectItem',
            items: [
              "home",
              "home",
              "home",
            ],
          ),
          18.verticalSpace,
          Text(
            "your Location",
            style: Styles.highlightAccent,
          ),
          12.verticalSpace,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: AppColors.neutralColor100.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: AppColors.neutralColor300,
              ),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  Assets.assetsImagesSvgMyAddressesIcon,
                ),
                10.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "My address",
                        style: Styles.contentAccent,
                      ),
                      4.verticalSpace,
                      Text(
                        "123 Main St, Anytown, USA",
                        style: Styles.footnoteSemiboldBold.copyWith(
                          color: AppColors.neutralColor600,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.keyboard_arrow_right_outlined,
                    color: AppColors.primaryColor900)
              ],
            ),
          ),
          18.verticalSpace,
          Text(
            "Session details",
            style: Styles.highlightAccent,
          ),
          12.verticalSpace,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: AppColors.neutralColor100.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: AppColors.neutralColor300,
              ),
            ),
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl:
                      "https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359554_1280.png",
                  width: 55.sp,
                  height: 55.sp,
                ),
                10.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "My address",
                        style: Styles.contentAccent,
                      ),
                      4.verticalSpace,
                      Text(
                        "123 Main St, Anytown, USA",
                        style: Styles.footnoteSemiboldBold.copyWith(
                          color: AppColors.neutralColor600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          14.verticalSpace,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: AppColors.neutralColor100.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: AppColors.neutralColor300,
              ),
            ),
            child: Row(
              children: [
                Text(
                  "Total",
                  style: Styles.footnoteSemiboldBold.copyWith(
                    color: AppColors.neutralColor600,
                  ),
                ),
                const Spacer(),
                Text(
                  "\$150.00",
                  style: Styles.contentAccent,
                ),
                // 4.verticalSpace,
              ],
            ),
          ),
          // 170.verticalSpace,
        ],
      ),
    );
  }
}

class SessionSelector extends StatelessWidget {
  final int numberOfDays;
  final List<String> sessionTimes;

  const SessionSelector({
    super.key,
    this.numberOfDays = 30,
    this.sessionTimes = const [
      '7:00 AM',
      '8:00 AM',
      '10:00 AM',
      '11:00 AM',
      '12:00 AM',
      '1:00 AM',
      '7:00 AM',
      '7:00 AM',
      '7:00 AM',
    ],
  });

  List<Map<String, String>> generateSessionDates(int days) {
    final now = DateTime.now();
    return List.generate(days, (i) {
      final date = now.add(Duration(days: i));
      return {
        'day': DateFormat('EEEE').format(date),
        'date': DateFormat('MMMM d').format(date),
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    final dates = generateSessionDates(numberOfDays);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Session Date',
          style: Styles.highlightAccent,
        ),
        10.verticalSpace,
        BlocBuilder<CreateBookingCubit, CreateBookingState>(
          buildWhen: (previous, current) => current is DateSelectedState,
          builder: (context, state) {
            final selectedDateIndex =
                context.read<CreateBookingCubit>().selectedDateIndex;

            return SizedBox(
              height: 90.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dates.length,
                itemBuilder: (context, index) {
                  final isSelected = selectedDateIndex == index;
                  return GestureDetector(
                    onTap: () =>
                        context.read<CreateBookingCubit>().selectDate(index),
                    child: Container(
                      width: 120.w,
                      margin: EdgeInsets.only(right: 10.w),
                      padding: EdgeInsets.all(12.sp),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primaryColor900
                            : Colors.white,
                        border: Border.all(color: AppColors.primaryColor900),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            dates[index]['day']!,
                            style: Styles.footnoteSemiboldBold.copyWith(
                              color: isSelected
                                  ? AppColors.neutralColor100
                                  : AppColors.neutralColor600,
                            ),
                          ),
                          4.verticalSpace,
                          Text(
                            dates[index]['date']!,
                            style: Styles.contentAccent.copyWith(
                              color: isSelected
                                  ? AppColors.neutralColor100
                                  : AppColors.neutralColor900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
        20.verticalSpace,
        Text(
          'Session Time',
          style: Styles.highlightAccent,
        ),
        10.verticalSpace,
        BlocBuilder<CreateBookingCubit, CreateBookingState>(
          buildWhen: (previous, current) => current is TimeSelectedState,
          builder: (context, state) {
            final selectedTimeIndex =
                context.read<CreateBookingCubit>().selectedTimeIndex;

            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: sessionTimes.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10.h,
                crossAxisSpacing: 10.w,
                childAspectRatio: 2.5,
              ),
              itemBuilder: (context, index) {
                final isSelected = selectedTimeIndex == index;
                return GestureDetector(
                  onTap: () =>
                      context.read<CreateBookingCubit>().selectTime(index),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color:
                          isSelected ? AppColors.primaryColor900 : Colors.white,
                      border: Border.all(color: AppColors.primaryColor900),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      sessionTimes[index],
                      style: Styles.footnoteSemiboldBold.copyWith(
                        color: isSelected
                            ? AppColors.neutralColor100
                            : AppColors.neutralColor900,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}

class BookingDetailsWidget extends StatelessWidget {
  const BookingDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
              const CustomRowMakeTitleAndDescWidget(
                title: 'Date',
                description: 'January 5',
              ),
              const CustomRowMakeTitleAndDescWidget(
                title: 'Time',
                description: '7:00 AM',
              ),
              const CustomRowMakeTitleAndDescWidget(
                title: 'Check in',
                description: 'December 23, 2022',
              ),
            ],
          ),
        ),
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
              const CustomRowMakeTitleAndDescWidget(
                title: 'Name',
                description: 'Omar AbdelAziz',
              ),
              const CustomRowMakeTitleAndDescWidget(
                title: 'Phone Number',
                description: '+201 027 324 902',
              ),
              const CustomRowMakeTitleAndDescWidget(
                title: 'Therapists Name',
                description: 'Ahmed Hossam',
              ),
            ],
          ),
        ),
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
              const CustomRowMakeTitleAndDescWidget(
                title: 'Total',
                description: '\$150.00',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
