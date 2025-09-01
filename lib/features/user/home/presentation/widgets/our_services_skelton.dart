import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:truee_balance_app/features/user/home/presentation/widgets/service_card_widget.dart';

class OurServicesSkeltonizer extends StatelessWidget {
  const OurServicesSkeltonizer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
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
                  itemCount: 20,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
    );
  }
}
