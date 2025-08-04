import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';
import 'package:truee_balance_app/core/widgets/circle_avatar/custom_circle_avatar_number_of_messages_widget.dart';

class CustomRowInMyTicketsWidget extends StatelessWidget {
  const CustomRowInMyTicketsWidget({
    super.key,
    required this.ticketNumber,
    required this.message,
  });

  final String ticketNumber;
  final String message;

  @override
  Widget build(BuildContext context) {
    return InkWell(
       onTap: (){
        context.pushNamed(Routes.chatScreen);
       },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: AppConstants.screenWidth(context) / 1.2,
            child: Column(
              spacing: 4.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ticketNumber,
                  style: Styles.contentEmphasis.copyWith(
                    color: AppColors.neutralColor1000,
                  ),
                ),
                Text(
                  message,
                  style: Styles.footnoteRegular.copyWith(
                    color: AppColors.neutralColor600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const CustomCircleAvatarNumberOfMessagesWidget(
            numberOfMessages: '3',
          ),
        ],
      ),
    );
  }
}
