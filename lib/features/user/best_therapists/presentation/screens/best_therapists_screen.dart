import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/features/user/best_therapists/presentation/widgets/therapist_card_widget.dart';

class BestTherapistsScreen extends StatelessWidget {
  const BestTherapistsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor900,
      appBar: CustomBasicAppBar(
        leading: BackButton(
          color: AppColors.neutralColor100,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: 'bestTherapists'.tr(),
        backgroundColor: AppColors.primaryColor900,
        svgAsset: 'assets/images/svg/bg_image.svg',
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                color: Colors.white,
                Icons.search,
              ),
            ),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(18.sp),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                // shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const TherapistCardWidget();
                },
                separatorBuilder: (context, index) => 16.verticalSpace,
                itemCount: 9,
              ),
            )
          ],
        ),
      ),
    );
  }
}
