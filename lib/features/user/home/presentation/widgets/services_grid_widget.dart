import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/features/user/home/presentation/widgets/service_card_widget.dart';

class ServicesGridWidget extends StatelessWidget {
  const ServicesGridWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> serviceNames = [
      "Rehabilitation Programs",
      "Physiotherapy",
      "Sports Injury Recovery",
      "Post-Surgical Rehab"
    ];
    List<String> serviceImages = [
      "assets/images/png/rehabilitation.png",
      "assets/images/png/physiotherapy.png",
      "assets/images/png/sports.png",
      "assets/images/png/post.png"
    ];
    return GridView.builder(
      itemCount: serviceNames.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 18.h,
        crossAxisSpacing: 12.w,
        childAspectRatio: 171.w / 114.h,
      ),
      itemBuilder: (context, index) {
        return ServiceCardWidget(
          image: serviceImages[index],
          title: serviceNames[index],
        );
      },
    );
  }
}
