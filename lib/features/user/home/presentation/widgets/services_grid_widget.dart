
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
      "Physiotherapy for Seniors",
      "Occupational Therapy",
      "Chiropractic Care",
      "Massage Therapy"
    ];
    return GridView.builder(
      itemCount: serviceNames.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16.h,
        crossAxisSpacing: 16.w,
        childAspectRatio: 171.w / 114.h,
      ),
      itemBuilder: (context, index) {
        return ServiceCardWidget(title: serviceNames[index],);
      },
    );
  }
}

