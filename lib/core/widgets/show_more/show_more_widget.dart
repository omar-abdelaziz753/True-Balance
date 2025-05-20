import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';

class ShowMoreWidget extends StatelessWidget {
  const ShowMoreWidget({
    super.key,
    required this.onTapShowMore,
    this.showMore = true,
    this.text,
  });

  final VoidCallback onTapShowMore;
  final bool showMore;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapShowMore,
      child: Text(
        showMore == true ? "home.showMore".tr() : text ?? '',
        style: Styles.captionEmphasis.copyWith(
          color: AppColors.primaryColor900,
        ),
      ),
    );
  }
}
