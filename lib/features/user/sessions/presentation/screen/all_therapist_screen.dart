import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/core/widgets/please%20login%20Buttom/please_login_buttom.dart';
import 'package:truee_balance_app/core/widgets/text_field/custom_text_form_field_widget.dart';
import 'package:truee_balance_app/features/user/sessions/bloc/cubit/sessions_cubit.dart';
import 'package:truee_balance_app/features/user/sessions/presentation/widgets/my_sessions_for_all_therapist_widgets.dart';
import 'package:truee_balance_app/features/user/sessions/presentation/widgets/skelton_mysessions_for_therapist.dart';

class AllTherapistScreen extends StatelessWidget {
  const AllTherapistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SessionsCubit>();

    return Scaffold(
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
        child: AppConstants.userToken == null
            ? const PleaseLoginButtom()
            : Column(
                children: [
                  if (context.watch<SessionsCubit>().allTherapistDataModel !=
                      null)
                    CustomTextFormFieldWidget(
                      hintText: 'searchTherapist'.tr(),
                      prefixIcon: const Icon(Icons.search),
                      onChanged: (value) {
                        debouncer.debounce(
                          duration: const Duration(milliseconds: 800),
                          onDebounce: () {
                            cubit.getAllTherapist(name: value);
                          },
                        );
                      },
                    ),
                  18.verticalSpace,
                  Expanded(
                    child: BlocBuilder<SessionsCubit, SessionsState>(
                      buildWhen: (previous, current) =>
                          current is GetAllTherapistLoadingState ||
                          current is GetAllTherapistSuccessState ||
                          current is GetAllTherapistFailureState,
                      builder: (context, state) {
                        if (state is GetAllTherapistLoadingState) {
                          return const SkeltonMySessionsForTherapist();
                        }

                        final therapists =
                            cubit.allTherapistDataModel?.data?.data ?? [];

                        if (therapists.isEmpty) {
                          return Center(
                            child: Text('noTherapistAvailable'.tr()),
                          );
                        }

                        return ListView.separated(
                          controller: cubit.therapistScrollController,
                          itemCount: therapists.length,
                          separatorBuilder: (context, index) =>
                              18.verticalSpace,
                          itemBuilder: (context, index) {
                            return MySessionsForAllTherapistWidgets(
                              data: therapists[index],
                            );
                          },
                        );
                      },
                    ),
                  ),
                  BlocBuilder<SessionsCubit, SessionsState>(
                    buildWhen: (previous, current) =>
                        current is GetAllTherapistLoadingMoreState ||
                        current is GetAllTherapistSuccessState,
                    builder: (context, state) {
                      if (state is GetAllTherapistLoadingMoreState) {
                        return const Padding(
                          padding: EdgeInsets.all(12.0),
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
