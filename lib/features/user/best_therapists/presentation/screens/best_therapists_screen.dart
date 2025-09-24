import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/core/widgets/text_field/custom_text_form_field_widget.dart';
import 'package:truee_balance_app/features/user/best_therapists/cubit/all_doctors_cubit.dart';
import 'package:truee_balance_app/features/user/best_therapists/presentation/widgets/best_therapists_widget_skelton.dart';
import 'package:truee_balance_app/features/user/best_therapists/presentation/widgets/therapist_card_widget.dart';

class BestTherapistsScreen extends StatelessWidget {
  const BestTherapistsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AllDoctorsCubit>();

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
            if (context.watch<AllDoctorsCubit>().doctorsModel != null)
              CustomTextFormFieldWidget(
                hintText: 'searchDoctor'.tr(),
                prefixIcon: const Icon(Icons.search),
                onChanged: (value) {
                  debouncer.debounce(
                    duration: const Duration(milliseconds: 800),
                    onDebounce: () {
                      cubit.getAllDoctors(search: value);
                    },
                  );
                },
              ),
            10.verticalSpace,
            // Expanded(
            //   child: BlocBuilder<AllDoctorsCubit, AllDoctorsState>(
            //     buildWhen: (previous, current) =>
            //         current is DoctorsLoading ||
            //         current is DoctorsSuccess ||
            //         current is DoctorsFailure,
            //     builder: (context, state) {
            //       if (state is DoctorsLoading) {
            //         return const BestTherapistsWidgetSkelton();
            //       }
            //       return ListView.separated(
            //         controller: cubit.doctorsScrollController,
            //         itemBuilder: (context, index) {
            //           return TherapistCardWidget(
            //               doctorModel: cubit.doctorsModel!.data.data[index]);
            //         },
            //         separatorBuilder: (context, index) => 16.verticalSpace,
            //         itemCount: cubit.doctorsModel!.data.data.length,
            //       );
            //     },
            //   ),
            // ),

            Expanded(
              child: BlocBuilder<AllDoctorsCubit, AllDoctorsState>(
                buildWhen: (previous, current) =>
                    current is DoctorsLoading ||
                    current is DoctorsSuccess ||
                    current is DoctorsFailure,
                builder: (context, state) {
                  if (state is DoctorsLoading) {
                    return const BestTherapistsWidgetSkelton();
                  }

                  final doctors = cubit.doctorsModel?.data.data ?? [];

                  if (doctors.isEmpty) {
                    return Center(
                      child: Text(
                        'noDoctorsFound'.tr(),
                        style: Styles.contentBold.copyWith(
                          color: AppColors.neutralColor600,
                        ),
                      ),
                    );
                  }

                  return ListView.separated(
                    controller: cubit.doctorsScrollController,
                    itemBuilder: (context, index) {
                      return TherapistCardWidget(
                        doctorModel: doctors[index],
                      );
                    },
                    separatorBuilder: (context, index) => 16.verticalSpace,
                    itemCount: doctors.length,
                  );
                },
              ),
            ),

            BlocBuilder<AllDoctorsCubit, AllDoctorsState>(
              buildWhen: (previous, current) =>
                  current is DoctorsLoadingMore || current is DoctorsSuccess,
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
  }
}
