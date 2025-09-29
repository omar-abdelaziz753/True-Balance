import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/widgets/images/cache_network_image/image_widget.dart';
import 'package:truee_balance_app/features/user/setting/bloc/settings_cubit.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({
    super.key,
    required this.cubit,
  });

  final SettingsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        cubit.chooseImageFromGallery();
      },
      child: Stack(
        children: [
          CircleAvatar(
            radius: 45.r,
            backgroundColor: AppColors.neutralColor200,
            child: cubit.profileImage != null
                ? ClipOval(
                    // child: Image.file(
                    //   cubit.profileImage!,
                    //   width: 90.r,
                    //   height: 90.r,
                    //   fit: BoxFit.cover,
                    //   errorBuilder: (context, error, stackTrace) => Icon(
                    //     Icons.person,
                    //     size: 45.r,
                    //     color: AppColors.neutralColor600,
                    //   ),
                    // ),
                    child: CacheNetworkImagesWidget(
                      image: cubit.profileImage?.path == ''
                          ? "assets/images/png/profile2.png"
                          : cubit.profileImage!.path,
                      width: 90.r,
                      height: 90.r,
                      isFile: true,
                    ),
                  )
                : cubit.getProfileDataModel?.data?.image != null

                    /// Omar.1234.@..
                    ? ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: cubit.getProfileDataModel!.data!.image!,
                          width: 90.r,
                          height: 90.r,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(
                            Icons.person,
                            size: 45.r,
                            color: AppColors.neutralColor600,
                          ),
                        ),
                      )
                    : Image.asset(
                        'assets/images/png/profile2.png',
                        width: 90.r,
                        height: 90.r,
                        fit: BoxFit.cover,
                      ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              radius: 12.r,
              backgroundColor: AppColors.primaryColor900,
              child: SvgPicture.asset(
                'assets/images/svg/canera_icon.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
