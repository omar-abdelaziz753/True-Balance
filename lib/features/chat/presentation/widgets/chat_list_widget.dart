import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/features/chat/presentation/widgets/chat_item_widget.dart';
import 'package:truee_balance_app/features/user/technical_support/bloc/technical_support_cubit.dart';

class ChatListWidget extends StatelessWidget {
  const ChatListWidget({
    Key? key,});


  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TechnicalSupportCubit>();

    return 
      ListView.separated(
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
              // final message = staticMessages[index];
              final message = cubit.ticketDetailsDataModel!.data!.messages![index];

              return ChatTextItemWidget(
                isSender: message.isAdmin == 1 ? false : true,
                message: message.message ?? '',
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
            itemCount: cubit.ticketDetailsDataModel!.data!.messages!.length,
          );
  }
}

class ChatMessage {
  final int isAdmin;
  final String message;

  const ChatMessage({required this.isAdmin, required this.message});
}
