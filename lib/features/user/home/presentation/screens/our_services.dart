import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/features/user/home/bloc/cubit/home_cubit.dart';
import 'package:truee_balance_app/features/user/home/presentation/widgets/service_card_widget.dart';

class OurServicesScreen extends StatelessWidget {
  const OurServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is ServicesSuccess ||
          current is ServicesFailure ||
          current is ServicesLoading,
      builder: (context, state) {
        if (state is ServicesLoading) {
          return Scaffold(
            backgroundColor: AppColors.primaryColor900,
            appBar: CustomBasicAppBar(
              leading: BackButton(
                color: AppColors.neutralColor100,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: 'ourServices'.tr(),
              backgroundColor: AppColors.primaryColor900,
              svgAsset: 'assets/images/svg/bg_image.svg',
            ),
            body: Skeletonizer(
              enabled: true,
              child: Column(
                children: [
                  Expanded(
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
                        child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: cubit.servicesModel?.data.data.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 18.h,
                            crossAxisSpacing: 12.w,
                            childAspectRatio: 171.w / 114.h,
                          ),
                          itemBuilder: (context, index) {
                            return const ServiceCardWidget(
                              image: 'assets/images/png/therapists.png',
                              title: 'dfdfdfdfdfdf',
                            );
                          },
                        )),
                  ),
                ],
              ),
            ),
          );
        }
        return Scaffold(
          backgroundColor: AppColors.primaryColor900,
          appBar: CustomBasicAppBar(
            leading: BackButton(
              color: AppColors.neutralColor100,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: 'ourServices'.tr(),
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
                    child: GridView.builder(
                      controller: cubit.servicesScrollController,
                      itemCount: cubit.servicesModel?.data.data.length ?? 0,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 18.h,
                        crossAxisSpacing: 12.w,
                        childAspectRatio: 171.w / 114.h,
                      ),
                      itemBuilder: (context, index) {
                        return ServiceCardWidget(
                          image: cubit.servicesModel?.data.data[index].icon,
                          title: cubit.servicesModel?.data.data[index].title,
                        );
                      },
                    ),
                  ),
                  BlocBuilder<HomeCubit, HomeState>(
                    buildWhen: (previous, current) =>
                        current is ServicesLoadingMore ||
                        current is ServicesSuccess,
                    builder: (context, state) {
                      if (state is ServicesLoadingMore) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ],
              )
              // ServicesGridWidget(serviceItem:Cubit.servicesModel!.data ),
              ),
        );
      },
    );
  }
}
