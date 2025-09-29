import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/features/user/create%20booking/data/model/all_therapist_data_model.dart';

class MySessionsForAllTherapistWidgets extends StatelessWidget {
  const MySessionsForAllTherapistWidgets({
    super.key,
    required this.data,
  });

  final Therapist data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(Routes.treatmentplansScreen, arguments: data.id!);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(12.sp),
        decoration: BoxDecoration(
          color: AppColors.neutralColor100,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: AppColors.neutralColor1000.withAlpha(20),
            width: 1.w,
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2.h),
              blurRadius: 8.r,
              spreadRadius: 0,
              color: Colors.black.withAlpha(20),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: 
              CachedNetworkImage(
                imageUrl: data.image!,
                width: 55.w,
                height: 55.h,
                errorWidget: (context, url, error) =>
                    Image.asset("assets/images/png/profile2.png"),
              ),
            ),
            12.horizontalSpace,
            Expanded(
              child: Column(
                spacing: 4.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name!,
                    style: Styles.contentBold.copyWith(
                      color: AppColors.neutralColor1000,
                    ),
                  ),
                  Text(
                    data.specialization!,
                    style: Styles.footnoteEmphasis.copyWith(
                      color: AppColors.neutralColor600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
