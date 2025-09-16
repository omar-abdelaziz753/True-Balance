import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/features/user/home/presentation/widgets/custom_count_of_no_of_notification_widget.dart';

class CustomMainAppBarInHomeWidget extends StatefulWidget
    implements PreferredSizeWidget {
  final String userName;
  final String location;
  final String profileImageAsset;
  String notificationCount;

  CustomMainAppBarInHomeWidget({
    super.key,
    required this.userName,
    required this.location,
    required this.profileImageAsset,
    required this.notificationCount,
  });

  @override
  Size get preferredSize => Size.fromHeight(140.h);

  @override
  State<CustomMainAppBarInHomeWidget> createState() =>
      _CustomMainAppBarInHomeWidgetState();
}

class _CustomMainAppBarInHomeWidgetState
    extends State<CustomMainAppBarInHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Background color and image
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

        /// Content
        Padding(
          padding: EdgeInsets.only(top: 60.h, left: 18.w, right: 18.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  spacing: 6.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      spacing: 8.w,
                      children: [
                        /// Profile Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25.r),
                          child: CachedNetworkImage(
                              imageUrl: widget.profileImageAsset,
                              width: 50.w,
                              height: 50.h,
                              errorWidget: (context, url, error) => Icon(
                                    Icons.error,
                                    size: 50.sp,
                                    color: Colors.grey,
                                  )),
                          // CacheNetworkImagesWidget(
                          //   image: profileImageAsset,
                          //   width: 50.w,
                          //   height: 50.h,
                          // )
                          // Image.asset(
                          //   profileImageAsset,
                          //   width: 50.w,
                          //   height: 50.h,
                          //   fit: BoxFit.cover,
                          // ),
                        ),

                        /// Welcome text and name
                        Expanded(
                          child: Column(
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
                                widget.userName,
                                style: Styles.contentEmphasis.copyWith(
                                  color: AppColors.neutralColor100,
                                ),
                              ),
                              4.verticalSpace,
                            ],
                          ),
                        )
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     Text(
                    //       'yourLocation'.tr(),
                    //       style: Styles.footnoteRegular.copyWith(
                    //         color: AppColors.neutralColor100,
                    //       ),
                    //     ),
                    //     Text(
                    //       location,
                    //       style: Styles.captionRegular.copyWith(
                    //         color: AppColors.neutralColor100,
                    //       ),
                    //     ),
                    //     Icon(
                    //       Icons.keyboard_arrow_down_rounded,
                    //       color: Colors.white,
                    //       size: 16.sp,
                    //     )
                    //   ],
                    // ),
                  ],
                ),
              ),

              /// Notification Bell with Badge
              Stack(
                clipBehavior: Clip.none,
                children: [
                  InkWell(
                    onTap: () {
                      context
                          .pushNamed(Routes.notificationsScreen)
                          .then((context) {
                        setState(() {
                          widget.notificationCount = 0.toString();
                        });
                      });
                    },
                    child: Container(
                      width: 48.w,
                      height: 48.h,
                      decoration: BoxDecoration(
                        color: AppColors.secondaryColor500,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: SvgPicture.asset(
                        'assets/images/svg/notification_icon.svg',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  widget.notificationCount == "0"
                      ? const SizedBox.shrink()
                      : CustomCountOfNoOfNotificationsWidget(
                          counter: widget.notificationCount,
                        ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
