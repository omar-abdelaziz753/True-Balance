import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/features/user/doctor%20deatils/bloc/cubit/doctor_details_cubit.dart';

class BestTherapistsAndReviewWidget extends StatelessWidget {
  const BestTherapistsAndReviewWidget({
    super.key,
    required this.cubit,
  });

  final DoctorDetailsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6.sp,
      children: [
        Text('bestTherapists'.tr(),
            style: Styles.contentEmphasis.copyWith(
                fontWeight: FontWeight.w600, fontSize: 14.sp)),
        const Icon(Icons.star,
            color: Color(0XFFFFDB43), size: 18),
        Text(
          cubit.doctorDetails?.data?.rateCount?.toString() ?? '0',
          style: Styles.contentEmphasis.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              color: AppColors.neutralColor600),
        ),
        Text(
          " | (${cubit.doctorDetails?.data?.rate?.toString() ?? '0'} ${'rate'.tr()})",
          style: Styles.contentEmphasis.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              color: AppColors.neutralColor600),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            context.pushNamed(Routes.allReviews,
                arguments: cubit.doctorDetails?.data?.id);
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
    );
  }
}
