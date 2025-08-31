import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/features/user/best_therapists/cubit/all_doctors_cubit.dart';
import 'package:truee_balance_app/features/user/best_therapists/presentation/widgets/therapist_card_widget.dart';
import 'package:truee_balance_app/features/user/home/data/model/doctors/all_doctors_data_model.dart';

class BestTherapistsScreen extends StatelessWidget {
  const BestTherapistsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AllDoctorsCubit>();
    return BlocBuilder<AllDoctorsCubit, AllDoctorsState>(
      buildWhen: (previous, current) =>
          current is DoctorsLoading ||
          current is DoctorsSuccess ||
          current is DoctorsFailure,
      builder: (context, state) {
        if (state is DoctorsLoading) {
          return Scaffold(
            backgroundColor: AppColors.primaryColor900,
            appBar: CustomBasicAppBar(
              title: 'doctors'.tr(),
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
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return TherapistCardWidget(
                              doctorModel: DoctorModel(
                            email: 'email',
                            name: 'name',
                            phone: 'phone',
                            image: 'image',about: "fdfdfd",
                            id: 1,age: 0 ,
                            gender: "male",
                            specialization: 'specialization',
                            type: 'type',
                            rate: 0.0,
                            rateCount: 0,
                          ));
                        },
                        separatorBuilder: (context, index) => 16.verticalSpace,
                        itemCount: 9,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
        return Scaffold(
          backgroundColor: AppColors.primaryColor900,
          appBar: CustomBasicAppBar(
            title: 'doctors'.tr(),
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
              children: [
                Expanded(
                  child: ListView.separated(
                    controller: cubit.doctorsScrollController,
                    itemBuilder: (context, index) {
                      return TherapistCardWidget(
                          doctorModel: cubit.doctorsModel!.data.data[index]);
                    },
                    separatorBuilder: (context, index) => 16.verticalSpace,
                    itemCount: cubit.doctorsModel!.data.data.length,
                  ),
                ),
                BlocBuilder<AllDoctorsCubit, AllDoctorsState>(
                  buildWhen: (previous, current) =>
                      current is DoctorsLoadingMore ||
                      current is DoctorsSuccess,
                  builder: (context, state) {
                    if (state is DoctorsLoadingMore) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
