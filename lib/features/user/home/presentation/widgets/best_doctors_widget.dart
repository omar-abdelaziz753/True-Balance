import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/features/user/home/bloc/cubit/home_cubit.dart';

class BestDoctorsWidget extends StatelessWidget {
  const BestDoctorsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is DoctorsLoading ||
          current is DoctorsSuccess ||
          current is DoctorsFailure,
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
                            color: AppColors.neutralColor10.withAlpha(10),
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
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Image.asset(
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
                                  .copyWith(color: AppColors.neutralColor1000),
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
                  itemCount: cubit.doctorsModel!.data.data.length,
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (_, __) => 12.horizontalSpace,
                  itemBuilder: (context, index) {
                    final data = cubit.doctorsModel!.data.data[index];

                    return InkWell(
                      onTap: () {
                        context.pushNamed(Routes.doctorDetailsScreen,
                            arguments: data);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                            color: AppColors.neutralColor10.withAlpha(10),
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
                                  padding: const EdgeInsets.only(top: 20),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50.r),
                                    child: CachedNetworkImage(
                                      imageUrl: cubit
                                          .doctorsModel!.data.data[index].image,
                                      fit: BoxFit.cover,
                                      width: 75.w,
                                      height: 75.h,
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            5.verticalSpace,
                            Text(
                              data.name,
                              style: Styles.highlightEmphasis
                                  .copyWith(color: AppColors.neutralColor1000),
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
                      ),
                    );
                  },
                ),
              );
      },
    );
  }
}
