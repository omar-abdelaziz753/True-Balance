import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/features/chat/presentation/widgets/chat_item_widget.dart';

class ChatListWidget extends StatelessWidget {
  const ChatListWidget({
    super.key,
    // required this.singleChatCubit,
  });
  // final ChatCubit singleChatCubit;
  final List<ChatMessage> staticMessages = const [
    ChatMessage(
      isAdmin: 1,
      message: 'Hey man!',
    ),
    ChatMessage(
      isAdmin: 0,
      message:
          'Hey, what’s up? How are you doing, my friends? It’s been a while xD',
    ),
    ChatMessage(
      isAdmin: 1,
      message:
          'Hey, what’s up? How are you doing, my friends? It’s been a while xD',
    ),
    ChatMessage(
      isAdmin: 0,
      message: 'Hey man!',
    ),
    ChatMessage(
      isAdmin: 1,
      message:
          'Hey, what’s up? How are you doing, my friends? It’s been a while xD',
    ),
  ];

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
      // controller: singleChatCubit.scrollController,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        final message = staticMessages[index];

        return ChatTextItemWidget(
          isSender: message.isAdmin == 1 ? false : true,
          message: message.message,
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
      itemCount: staticMessages.length,
    );
  }
}
class ChatMessage {
  final int isAdmin;
  final String message;

  const ChatMessage({required this.isAdmin, required this.message});
}
