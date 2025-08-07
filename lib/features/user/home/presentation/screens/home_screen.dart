import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:truee_balance_app/core/cache_helper/cache_helper.dart';
import 'package:truee_balance_app/core/cache_helper/cache_keys.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_main_app_bar_in_home_widget.dart';
import 'package:truee_balance_app/features/user/home/bloc/cubit/home_cubit.dart';
import 'package:truee_balance_app/features/user/home/presentation/widgets/banner_widget.dart';
import 'package:truee_balance_app/features/user/home/presentation/widgets/custom_service_card_widget.dart';
import 'package:truee_balance_app/features/user/main_layout/business_logic/main_layout_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor900,
      appBar: CustomMainAppBarInHomeWidget(
        userName: CacheHelper.getData(key: CacheKeys.userName) ?? "",
        location: 'myAddressHere'.tr(),
        profileImageAsset: 'assets/images/png/profile_image.png',
        notificationCount: '3',
      ),
      body: Container(
        padding: EdgeInsets.all(20.sp),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BannerWidget(),
              18.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ourServices'.tr(),
                    style: Styles.captionAccent.copyWith(
                      color: AppColors.neutralColor1000,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.pushNamed(Routes.ourServicesScreen);
                    },
                    child: Text(
                      'seeAll'.tr(),
                      style: Styles.captionAccent.copyWith(
                        color: AppColors.secondaryColor500,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.secondaryColor500,
                        decorationThickness: 1.5.w,
                      ),
                    ),
                  ),
                ],
              ),
              12.verticalSpace,
              SizedBox(
                height: 120.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (_, __) => 12.horizontalSpace,
                  itemBuilder: (context, index) {
                    final titles = [
                      'Physiotherapy',
                      'Occupational Therapy',
                      'Speech Therapy',
                    ];
                    final images = [
                      'assets/images/png/physiotherapy.png',
                      'assets/images/png/sports.png',
                      'assets/images/png/post.png',
                    ];
                    return CustomServiceCardWidget(
                      title: titles[index],
                      image: images[index],
                    );
                  },
                ),
              ),
              30.verticalSpace,
              GestureDetector(
                onTap: () => MainLayoutCubit.get(context).changeBottomNavBar(1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'bestDoctors'.tr(),
                      style: Styles.captionAccent.copyWith(
                        color: AppColors.neutralColor1000,
                      ),
                    ),
                    Text(
                      'seeAll'.tr(),
                      style: Styles.captionAccent.copyWith(
                        color: AppColors.secondaryColor500,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.secondaryColor500,
                        decorationThickness: 1.5.w,
                      ),
                    ),
                  ],
                ),
              ),
              12.verticalSpace,
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  final cubit = context.read<HomeCubit>();

                  return cubit.doctorsModel == null ||
                          cubit.doctorsModel!.data.data.isEmpty
                      ? Skeletonizer(
                          enabled: true,
                          child: SizedBox(
                            height: 160.h,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: 6,
                              physics: const BouncingScrollPhysics(),
                              separatorBuilder: (_, __) => 12.horizontalSpace,
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    border: Border.all(
                                      color: AppColors.neutralColor10
                                          .withAlpha(10),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Stack(
                                        alignment: Alignment.topCenter,
                                        children: [
                                          Image.asset(
                                            'assets/images/png/back_ground_doctor.png',
                                            fit: BoxFit.cover,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 15),
                                            child: Image.asset(
                                              // <<<<<<< Services
                                              width: 81.w,
                                              height: 81.h,
                                              'assets/images/png/back_ground_iamge.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ],
                                      ),
                                      5.verticalSpace,
                                      Text(
                                        "Wade Warren",
                                        style: Styles.highlightEmphasis
                                            .copyWith(
                                                color:
                                                    AppColors.neutralColor1000),
                                      ),
                                      5.verticalSpace,
                                      Text(
                                        "Specialization Here",
                                        style: Styles.captionRegular.copyWith(
                                          color: AppColors.neutralColor600,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      : SizedBox(
                          height: 160.h,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: 6,
                            physics: const BouncingScrollPhysics(),
                            separatorBuilder: (_, __) => 12.horizontalSpace,
                            itemBuilder: (context, index) {
                              final data = cubit.doctorsModel!.data.data[index];

                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  border: Border.all(
                                    color:
                                        AppColors.neutralColor10.withAlpha(10),
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Stack(
                                      alignment: Alignment.topCenter,
                                      children: [
                                        Image.asset(
                                          'assets/images/png/back_ground_doctor.png',
                                          fit: BoxFit.cover,
                                        ),

                                        // Padding(
                                        //   padding:
                                        //       const EdgeInsets.only(top: 15),
                                        //   child: Image.asset(
                                        //     // <<<<<<< Services
                                        //     width: 81.w,
                                        //     height: 81.h,
                                        //     'assets/images/png/back_ground_iamge.png',
                                        //     fit: BoxFit.cover,
                                        //   ),
                                        // ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50.r),
                                            child: CachedNetworkImage(
                                              imageUrl: cubit.doctorsModel!.data
                                                  .data[index].image,
                                              fit: BoxFit.cover,
                                              width: 75.w,
                                              height: 75.h,
                                            ),
                                          ),
                                        )
                                        //                               Padding(
                                        //                                 padding: const EdgeInsets.only(top: 20),
                                        //                                 child: Image.asset(
                                        //                                   width: 75.w,
                                        //                                   height: 75.h,
                                        //                                   'assets/images/png/doctor_image.png',
                                        // =======
                                        //                                   'assets/images/png/best_doctor.png',
                                        // >>>>>>> main
                                        //                                   fit: BoxFit.cover,
                                        //                                 ),
                                        //                               ),
                                      ],
                                    ),
                                    5.verticalSpace,
                                    Text(
                                      data.name,
                                      style: Styles.highlightEmphasis.copyWith(
                                          color: AppColors.neutralColor1000),
                                    ),
                                    5.verticalSpace,
                                    Text(
                                      data.specialization,
                                      style: Styles.captionRegular.copyWith(
                                        color: AppColors.neutralColor600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
