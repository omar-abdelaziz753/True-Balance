import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/features/user/doctor%20deatils/bloc/cubit/doctor_details_cubit.dart';
import 'package:truee_balance_app/features/user/doctor%20deatils/data/model/doctor_details_model.dart';
import 'package:truee_balance_app/features/user/doctor%20deatils/presentation/widgets/review_Item_widget.dart';

class AllReviews extends StatelessWidget {
  const AllReviews({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DoctorDetailsCubit>();

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
        title: 'allReviews'.tr(),
        backgroundColor: AppColors.primaryColor900,
        svgAsset: 'assets/images/svg/bg_image.svg',
      ),
      body: BlocBuilder<DoctorDetailsCubit, DoctorDetailsState>(
        buildWhen: (previous, current) =>
            current is DoctorReviewsSuccess ||
            current is DoctorReviewsLoading ||
            current is DoctorReviewsFailure,
        builder: (context, state) {
          if (state is DoctorReviewsLoading) {
            return Skeletonizer(
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
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 10,
                        shrinkWrap: true,
                        separatorBuilder: (BuildContext context, int index) {
                          return 10.verticalSpace;
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return ReviewItemWidget(
                            userRating: UserRating(
                                date: "10/15/200",
                                userId: 2,
                                userName: 'mohamed',
                                userRate: 4,
                                userMessage: 'sfasfsfsfsafasfasfafafafafafafa'),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            );
          }
          return Container(
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
                        child: (cubit.doctorReviews?.data?.reviews?.isEmpty ??
                                true)
                            ? Center(child: Text("noReviews".tr()))
                            : ListView.separated(
                                controller: cubit.scrollController,
                                itemCount: cubit
                                        .doctorReviews?.data?.reviews?.length ??
                                    0,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return 10.verticalSpace;
                                },
                                itemBuilder: (BuildContext context, int index) {
                                  final userRating = cubit
                                      .doctorReviews?.data?.reviews![index];
                                  // if (userRating == null) {
                                  //   return const SizedBox.shrink();
                                  // }
                                  return ReviewItemWidget(
                                      userRating: userRating!);
                                },
                              ),
                      ),
                      BlocBuilder<DoctorDetailsCubit, DoctorDetailsState>(
                        buildWhen: (previous, current) =>
                            current is DoctorReviewsSuccess ||
                            current is DoctorReviewsLoadingMore,
                        builder: (context, state) {
                          if (state is DoctorReviewsLoadingMore) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          return const SizedBox.shrink();
                        },
                      )
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
