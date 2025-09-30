import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';

class AppBarInCalenderScreenWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String userName;
  final String profileImageUrl;

  const AppBarInCalenderScreenWidget({
    super.key,
    required this.userName,
    required this.profileImageUrl,
  });

  @override
  Size get preferredSize => Size.fromHeight(140.h);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 180.h,
          color: AppColors.primaryColor900,
          child: Opacity(
            opacity: 0.1,
            child: SvgPicture.asset(
              'assets/images/svg/bg_image.svg',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 60.h, left: 18.w, right: 18.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25.r),
                child: CachedNetworkImage(
                  imageUrl: profileImageUrl,
                  width: 50.w,
                  height: 50.h,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Image.asset(
                    "assets/images/png/profile2.png",
                    width: 50.w,
                    height: 50.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              12.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'welcomeBack'.tr(),
                    style: Styles.footnoteRegular.copyWith(
                      color: AppColors.neutralColor100,
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    userName,
                    style: Styles.contentEmphasis.copyWith(
                      color: AppColors.neutralColor100,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
