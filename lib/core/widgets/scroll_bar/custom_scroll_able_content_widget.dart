import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';

class CustomScrollAbleContentWidget extends StatelessWidget {
  const CustomScrollAbleContentWidget({super.key, required this.scrollController, required this.contentWidget});

  final ScrollController scrollController;
  final Widget contentWidget;

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      controller: scrollController,
      thumbVisibility: true,
      thumbColor: AppColors.primaryColor900,
      trackColor: AppColors.neutralColor200,
      thickness: 4.w,
      radius: Radius.circular(4.r),
      scrollbarOrientation: ScrollbarOrientation.left,
      child: SingleChildScrollView(
        controller: scrollController,
        padding: EdgeInsets.only(left: 16.w),
        child: contentWidget,
      ),
    );
  }
}
