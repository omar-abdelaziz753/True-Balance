import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/features/user/technical_support/presentation/widgets/custom_section_in_about_us_widget.dart';

class CustomScrollAbleContentWidget extends StatelessWidget {
  const CustomScrollAbleContentWidget({super.key, required this.scrollController, required this.contentWidget});

  final ScrollController scrollController;
  final Widget contentWidget;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      padding: EdgeInsets.only(left: 16.w),
      child: contentWidget,
    );
  }
}
