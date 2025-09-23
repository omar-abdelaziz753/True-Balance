import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:truee_balance_app/features/user/home/presentation/widgets/custom_service_card_widget.dart';

class OurServicesSkeltonizerInHome extends StatelessWidget {
  const OurServicesSkeltonizerInHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
  }
}
