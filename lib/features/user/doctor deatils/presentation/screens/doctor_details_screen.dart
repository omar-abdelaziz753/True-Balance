import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';
import 'package:truee_balance_app/features/user/doctor%20deatils/bloc/cubit/doctor_details_cubit.dart';
import 'package:truee_balance_app/features/user/doctor%20deatils/presentation/widgets/best_therapists_and_review_widget.dart';
import 'package:truee_balance_app/features/user/doctor%20deatils/presentation/widgets/doctor_details_widget.dart';
import 'package:truee_balance_app/features/user/doctor%20deatils/presentation/widgets/review_item_widget.dart';
import 'package:truee_balance_app/features/user/doctor%20deatils/presentation/widgets/skeletonizer_for_doctor_details.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DoctorDetailsCubit>();
    return BlocBuilder<DoctorDetailsCubit, DoctorDetailsState>(
      buildWhen: (previous, current) =>
          current is DoctorDetailsSuccess ||
          current is DoctorDetailsFailure ||
          current is DoctorDetailsLoading,
      builder: (context, state) {
        if (state is DoctorDetailsLoading) {
          return Scaffold(
            backgroundColor: AppColors.primaryColor900,
            appBar: CustomBasicAppBar(
              leading: BackButton(
                color: AppColors.neutralColor100,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: "mohamed",
              backgroundColor: AppColors.primaryColor900,
              svgAsset: 'assets/images/svg/bg_image.svg',
            ),
            body: const SkeletonizerForDoctorDetails(),
            bottomNavigationBar: Container(
              color: Colors.white,
              child: CustomButtonWidget(
                margin:
                    EdgeInsets.only(bottom: 20.sp, left: 20.sp, right: 20.sp),
                text: 'booking'.tr(),
                textStyle: Styles.captionEmphasis.copyWith(
                  color: AppColors.neutralColor100,
                ),
                onPressed: () {},
              ),
            ),
          );
        }
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomBasicAppBar(
            leading: BackButton(
              color: AppColors.neutralColor100,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: cubit.doctorDetails?.data?.name ?? '',
            backgroundColor: AppColors.primaryColor900,
            svgAsset: 'assets/images/svg/bg_image.svg',
          ),
          body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(18.sp),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DoctorDetailsWidget(cubit: cubit),
                  10.verticalSpace,
                  Text('about'.tr(),
                      style: Styles.contentEmphasis.copyWith(
                          fontWeight: FontWeight.w600, fontSize: 14.sp)),
                  const SizedBox(height: 8),
                  Text(
                    (cubit.doctorDetails?.data?.about?.isNotEmpty ?? false)
                        ? cubit.doctorDetails!.data!.about!
                        : 'No About',
                    style: Styles.contentEmphasis.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: AppColors.neutralColor600,
                    ),
                  ),
                  16.verticalSpace,
                  BestTherapistsAndReviewWidget(cubit: cubit),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:
                        (cubit.doctorDetails?.data?.ratings?.ratings?.length ??
                                    0) <=
                                3
                            ? (cubit.doctorDetails?.data?.ratings?.ratings
                                    ?.length ??
                                0)
                            : 3,
                    separatorBuilder: (BuildContext context, int index) {
                      return 10.verticalSpace;
                    },
                    itemBuilder: (BuildContext context, int index) {
                      final userRating =
                          cubit.doctorDetails?.data?.ratings?.ratings?[index];
                      if (userRating == null) {
                        return const SizedBox.shrink();
                      }
                      return ReviewItemWidget(userRating: userRating);
                    },
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            color: Colors.white,
            child: CustomButtonWidget(
              margin: EdgeInsets.only(bottom: 20.sp, left: 20.sp, right: 20.sp),
              text: 'booking'.tr(),
              textStyle: Styles.captionEmphasis.copyWith(
                color: AppColors.neutralColor100,
              ),
              onPressed: () {
                context.pushNamed(Routes.bookingScreen,
                    arguments: cubit.doctorDetails!.data);
              },
            ),
          ),
        );
      },
    );
  }
}
