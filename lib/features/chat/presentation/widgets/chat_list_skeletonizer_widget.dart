import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/features/chat/presentation/widgets/chat_item_widget.dart';

class ChatListSkeletonizerWidget extends StatelessWidget {
  const ChatListSkeletonizerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.only(
        top: 20.h,
        right: 20.w,
        left: 20.h,
        bottom: 40.h,
      ),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return const Skeletonizer(
          enabled: true,
          child: ChatTextItemWidget(
            isSender: true,
            message: 'Loading...',
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            16.verticalSpace,
            Container(
              height: 1.sp,
              color: AppColors.neutralColor100,
            ),
            16.verticalSpace,
          ],
        );
      },
      itemCount: 10,
    );
  }
}
