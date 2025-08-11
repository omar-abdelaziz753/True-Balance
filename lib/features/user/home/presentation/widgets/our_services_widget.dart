
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:truee_balance_app/features/user/home/bloc/cubit/home_cubit.dart';
import 'package:truee_balance_app/features/user/home/presentation/widgets/custom_service_card_widget.dart';

class OurServicesWidget extends StatelessWidget {
  const OurServicesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is ServicesLoading ||
          current is ServicesSuccess ||
          current is ServicesFailure,
      builder: (context, state) {
        if (state is ServicesSuccess) {
          return SizedBox(
            height: 120.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: cubit.servicesModel!.data.data.length > 5
                  ? 5
                  : cubit.servicesModel!.data.data.length,
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (_, __) => 12.horizontalSpace,
              itemBuilder: (context, index) {
                return CustomServiceCardWidget(
                    title: cubit.servicesModel!.data.data[index].title,
                    image: cubit.servicesModel!.data.data[index].icon);
              },
            ),
          );
        }
        return Skeletonizer(
          enabled: true,
          child: SizedBox(
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
        );
      },
    );
  }
}
