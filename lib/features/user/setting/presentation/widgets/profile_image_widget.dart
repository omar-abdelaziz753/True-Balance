import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
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
                    child: Image.file(
                      cubit.profileImage!,
                      width: 90.r,
                      height: 90.r,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Icon(
                        Icons.person,
                        size: 45.r,
                        color: AppColors.neutralColor600,
                      ),
                    ),
                  )
                : cubit.getProfileDataModel?.data?.image != null
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
                    : Icon(
                        Icons.person,
                        size: 45.r,
                        color: AppColors.neutralColor600,
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
