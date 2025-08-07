import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/widgets/images/cache_network_image/image_widget.dart';
import 'package:truee_balance_app/features/user/home/bloc/cubit/home_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SliderLoading ||
          current is SliderSuccess ||
          current is SliderFailure,
      builder: (context, state) {
        if (state is SliderSuccess) {
          return Column(
            children: [
              CarouselSlider.builder(
                itemCount: cubit.sliderModel?.data.length ?? 0,
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  aspectRatio: 17.h / 7.h,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayInterval: const Duration(seconds: 3),
                  onPageChanged: (index, reason) {
                    context.read<HomeCubit>().changeIndex(index);
                  },
                ),
                itemBuilder: (context, index, realIndex) {
                  return InkWell(
                    onTap: () async {
                      final Uri url =
                          Uri.parse(cubit.sliderModel!.data[index].btnUrl);

                      await launchUrl(url);
                    },
                    child: CacheNetworkImagesWidget(
                      image: cubit.sliderModel?.data[index].background ?? '',
                      boxFit: BoxFit.fill,
                    ),
                  );
                },
              ),
              SizedBox(height: 12.h),
              BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (previous, current) => current is HomeIndexChanged,
                builder: (context, state) {
                  final currentIndex =
                      context.read<HomeCubit>().currentBannerIndex;
                  return AnimatedSmoothIndicator(
                    activeIndex: currentIndex,
                    count: cubit.sliderModel?.data.length ?? 0,
                    effect: WormEffect(
                      dotHeight: 6.h,
                      dotWidth: 6.w,
                      activeDotColor: AppColors.secondaryColor500,
                      dotColor: AppColors.neutralColor200,
                    ),
                  );
                },
              ),
            ],
          );
        }
        return const BannerWidgetSketon();
      },
    );
  }
}

class BannerWidgetSketon extends StatelessWidget {
  const BannerWidgetSketon({super.key});

  static const List<String> banners = [
    'assets/images/png/banner_image.png',
    'assets/images/png/banner_image.png',
    'assets/images/png/banner_image.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Column(
        children: [
          CarouselSlider.builder(
            itemCount: banners.length,
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              aspectRatio: 17.h / 7.h,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayInterval: const Duration(seconds: 3),
              onPageChanged: (index, reason) {
                context.read<HomeCubit>().changeIndex(index);
              },
            ),
            itemBuilder: (context, index, realIndex) {
              return CacheNetworkImagesWidget(
                image: banners[index],
                boxFit: BoxFit.fill,
              );
            },
          ),
          SizedBox(height: 12.h),
          BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (previous, current) => current is HomeIndexChanged,
            builder: (context, state) {
              final currentIndex = context.read<HomeCubit>().currentBannerIndex;
              return AnimatedSmoothIndicator(
                activeIndex: currentIndex,
                count: banners.length,
                effect: WormEffect(
                  dotHeight: 6.h,
                  dotWidth: 6.w,
                  activeDotColor: AppColors.secondaryColor500,
                  dotColor: AppColors.neutralColor200,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
