import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/core/widgets/text_field/custom_text_form_field_widget.dart';
import 'package:truee_balance_app/features/chat/presentation/widgets/chat_list_widget.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor900,
      appBar: CustomBasicAppBar(
        leading: BackButton(
          color: AppColors.neutralColor100,
          onPressed: () {
            context.pop();
          },
        ),
        title: '#TICKET-12987'.tr(),
        backgroundColor: AppColors.primaryColor900,
        svgAsset: 'assets/images/svg/bg_image.svg',
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(18.sp),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r),
              ),
            ),
            child: const Column(
              children: [
                Expanded(child: ChatListWidget()),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          left: 20.sp,
          top: 10.sp,
          right: 20.sp,
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
        ),
        child: Form(
          child: Row(
            children: [
              Expanded(
                child: CustomTextFormFieldWidget(
                  borderWidth: 3.w,
                  borderColor: AppColors.neutralColor300,
                  // backgroundColor: AppColors.neutralColor600,
                  isChat: true,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "please_enter_valid_message".tr();
                    }
                    return null;
                  },
                  onChanged: (value) {
                    // singleChatCubit.showSendBUtton(letters: value);
                  },
                  controller: TextEditingController(),
                  // labelText: "message".tr(),
                ),
              ),
              Visibility(
                // visible: singleChatCubit.isTypeing,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    size: 30.sp,
                    Icons.send,
                    color: AppColors.neutralColor300,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
