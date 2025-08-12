
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/images/cache_network_image/image_widget.dart';
import 'package:truee_balance_app/features/user/session%20details/bloc/cubit/session_details_cubit.dart';

class RowTreatmentPlan extends StatelessWidget {
  const RowTreatmentPlan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SessionDetailsCubit>();
    return Row(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: CacheNetworkImagesWidget(
              image: cubit.treatmentPlanDetail?.therapist.image ?? '',
              width: 55.w,
              height: 55.h,
            )),
        12.horizontalSpace,
        Expanded(
          child: Column(
            spacing: 4.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cubit.treatmentPlanDetail?.therapist.name ?? '',
                style: Styles.contentBold.copyWith(
                  color: AppColors.neutralColor1000,
                ),
              ),
              Text(
                cubit.treatmentPlanDetail?.therapist.specialization ?? '',
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
    );
  }
}
