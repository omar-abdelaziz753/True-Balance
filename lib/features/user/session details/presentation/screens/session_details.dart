import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';
import 'package:truee_balance_app/features/user/add%20session/presentation/widgets/details_row_widget.dart';
import 'package:truee_balance_app/features/user/session%20details/data/model/treatment_plan_detail.dart';
import 'package:truee_balance_app/features/user/session%20details/presentation/widgets/session_completed_widget.dart';
import 'package:truee_balance_app/features/user/session%20details/presentation/widgets/show_rating_botom_sheet_for_user_sesions.dart';

class SessionDetails extends StatelessWidget {
  const SessionDetails({super.key, required this.session});
  final Session session;
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
        title: "Session ${session.index! + 1}",
        backgroundColor: AppColors.primaryColor900,
        svgAsset: 'assets/images/svg/bg_image.svg',
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
          spacing: 15.sp,
          children: [
            Container(
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
                    color: Colors.black.withAlpha(20),
                  ),
                ],
              ),
              child: Column(
                spacing: 10.sp,
                children: [
                  DetailsRowWidget(
                      label: 'sessionData'.tr(), value: session.date),
                  DetailsRowWidget(
                      label: 'sessionTime'.tr(), value: session.time),
                ],
              ),
            ),
            if (session.status == "completed") ...[
              SessionCompletedWidget(session: session),
              const Spacer(),
              if (session.rating == null)
                // CustomButtonWidget(
                //   text: 'addRating'.tr(),
                //   onPressed: () {
                //     showRatingBottomSheetForUserSessions(context, session.id);
                //   },
                // )
                ButtomWidget(session: session)
            ]
          ],
        ),
      ),
    );
  }
}

class ButtomWidget extends StatefulWidget {
  const ButtomWidget({super.key, required this.session});
  final Session session;

  @override
  State<ButtomWidget> createState() => _ButtomWidgetState();
}

class _ButtomWidgetState extends State<ButtomWidget> {
  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    return !isShow
        ? CustomButtonWidget(
            text: 'addRating'.tr(),
            onPressed: () {
              showRatingBottomSheetForUserSessions(context, widget.session.id)
                  .then((value) {
                if (value != null && value == true) {
                  setState(() {
                    isShow = true;
                  });
                }
              });
            },
          )
        : const SizedBox.shrink();
  }
}
