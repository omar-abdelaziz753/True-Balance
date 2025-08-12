import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/services/di/dependency_injection.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/assets.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/core/widgets/text_field/custom_text_form_field_widget.dart';
import 'package:truee_balance_app/features/chat/presentation/widgets/chat_list_widget.dart';
import 'package:truee_balance_app/features/user/technical_support/bloc/technical_support_cubit.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key, required this.id});

  final int id;

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
        title: '#$id'.tr(),
        backgroundColor: AppColors.primaryColor900,
        svgAsset: 'assets/images/svg/bg_image.svg',
      ),
      body: BlocBuilder<TechnicalSupportCubit, TechnicalSupportState>(
        builder: (context, state) {
          final cubit = context.read<TechnicalSupportCubit>();

          return Stack(
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
                child: Column(
                  children: [
                    Expanded(child: BlocBuilder<TechnicalSupportCubit,
                        TechnicalSupportState>(
                      builder: (context, state) {
                        final cubit = context.read<TechnicalSupportCubit>();

                        return ChatListWidget();
                      },
                    )),
                  ],
                ),
              )
            ],
          );
        },
      ),
      bottomNavigationBar:
          BlocConsumer<TechnicalSupportCubit, TechnicalSupportState>(
        listener: (context, state) {
          if (state is SendMessageSuccessState) {
            context.read<TechnicalSupportCubit>()
              ..getTicketDetails(ticketId: id.toString());
            context.read<TechnicalSupportCubit>().messageController.clear();
          }
        },
        builder: (context, state) {
          final cubit = context.read<TechnicalSupportCubit>();

          return Container(
            width: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.only(
              left: 20.sp,
              top: 10.sp,
              right: 20.sp,
              bottom: MediaQuery.of(context).viewInsets.bottom + 40,
            ),
            child: Form(
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextFormFieldWidget(
                      hintText: "Write your message...",
                      controller: cubit.messageController,
                      borderWidth: 1.w,
                      borderColor: AppColors.neutralColor300,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          cubit.sendMessage(ticketId: id.toString());
                        },
                        child: SvgPicture.asset(
                          Assets.assetsImagesSvgSendIcon,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
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
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
