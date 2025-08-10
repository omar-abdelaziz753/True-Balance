
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/core/widgets/images/cache_network_image/image_widget.dart';
import 'package:truee_balance_app/features/user/create%20booking/bloc/cubit/create_booking_cubit.dart';

class AllTherapistScreen extends StatelessWidget {
  const AllTherapistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateBookingCubit, CreateBookingState>(
      buildWhen: (previous, current) =>
          current is GetAllTherapistFailureState ||
          current is GetAllTherapistSuccessState ||
          current is GetAllTherapistFailureState,
      builder: (context, state) {
        if (state is GetAllTherapistLoadingState) {
          return Skeletonizer(
            enabled: true,
            child: Scaffold(
              backgroundColor: AppColors.primaryColor900,
              appBar: CustomBasicAppBar(
                title: 'mySessions'.tr(),
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
                child: ListView.separated(
                  itemCount: 9, 
                  separatorBuilder: (context, index) => 18.verticalSpace,
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(12.sp),
                      decoration: BoxDecoration(
                        color: AppColors.neutralColor100,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: AppColors.neutralColor1000.withAlpha(20),
                          width: 1.w,
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 2.h),
                            blurRadius: 8.r,
                            spreadRadius: 0,
                            color: Colors.black.withAlpha(20),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.r),
                            child: Container(
                              width: 55.w,
                              height: 55.h,
                              color: Colors.grey[300],
                            ),
                          ),
                          12.horizontalSpace,
                          Expanded(
                            child: Column(
                              spacing: 4.h,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 14.h,
                                  color: Colors.grey[300],
                                ),
                                Container(
                                  height: 12.h,
                                  width: 150.w,
                                  color: Colors.grey[300],
                                ),
                              ],
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
            title: 'mySessions'.tr(),
            backgroundColor: AppColors.primaryColor900,
            svgAsset: 'assets/images/svg/bg_image.svg',
          ),
          body: BlocBuilder<CreateBookingCubit, CreateBookingState>(
            builder: (context, state) {
              final cubit = context.read<CreateBookingCubit>();
              return cubit.allTherapistDataModel == null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : cubit.allTherapistDataModel?.data?.data?.isEmpty == true
                      ? Center(
                          child: Text('noTherapistAvailable'.tr()),
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
                          child: ListView.separated(
                            itemCount: cubit.allTherapistDataModel?.data?.data
                                    ?.length ??
                                0,
                            separatorBuilder: (context, index) =>
                                18.verticalSpace,
                            itemBuilder: (context, index) {
                              final data = cubit
                                  .allTherapistDataModel?.data?.data?[index];
                              return Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(12.sp),
                                decoration: BoxDecoration(
                                  color: AppColors.neutralColor100,
                                  borderRadius: BorderRadius.circular(12.r),
                                  border: Border.all(
                                    color: AppColors.neutralColor1000
                                        .withAlpha(20),
                                    width: 1.w,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 2.h),
                                      blurRadius: 8.r,
                                      spreadRadius: 0,
                                      color: Colors.black.withAlpha(20),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12.r),
                                      child: CacheNetworkImagesWidget(
                                        image: data!.image!,
                                        width: 55.w,
                                        height: 55.h,
                                      ),
                                    ),
                                    12.horizontalSpace,
                                    Expanded(
                                      child: Column(
                                        spacing: 4.h,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data.name!,
                                            style: Styles.contentBold.copyWith(
                                              color: AppColors.neutralColor1000,
                                            ),
                                          ),
                                          Text(
                                            data.specialization!,
                                            style: Styles.footnoteEmphasis
                                                .copyWith(
                                              color: AppColors.neutralColor600,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
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
