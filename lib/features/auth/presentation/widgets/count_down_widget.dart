import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/text/custom_text_rich_widget.dart';
import 'package:truee_balance_app/features/auth/business_logic/auth_cubit.dart';

class CountDownWidget extends StatefulWidget {
  CountDownWidget({
    super.key,
    required int resendKey,
    required this.data,
    required this.cubit,
  }) : resendKey = resendKey;

  int resendKey;
  final Map<String, dynamic> data;
  final AuthCubit cubit;

  @override
  State<CountDownWidget> createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ResendPasswordLoadingState) {
          setState(() {
            widget.resendKey++;
          });
        }
      },
      child: StreamBuilder<String>(
        key: ValueKey(widget.resendKey),
        stream: countdownStream(const Duration(minutes: 2)),
        builder: (context, snapshot) {
          final timerText = snapshot.data ?? "(02 m 00 s)";

          final isTimerFinished = timerText.contains("00 m 00 s") ||
              snapshot.connectionState == ConnectionState.done;

          return CustomRichText(
            text1: "theCodeWillExpire".tr(),
            textStyle1: Styles.captionRegular.copyWith(
              color: AppColors.neutralColor1000,
            ),
            text2: timerText,
            textStyle2: Styles.captionRegular.copyWith(
              color: AppColors.primaryColor900,
            ),
            text3: "resend".tr(),
            textStyle3: Styles.captionRegular.copyWith(
              color: isTimerFinished
                  ? AppColors.primaryColor700
                  : AppColors.neutralColor600,
            ),
            onTap3: !isTimerFinished
                ? () {
                    if (widget.data['screenName'] == "Register") {
                      widget.cubit.userRegister(isResend: true);
                    } else {
                      widget.cubit.forgetPassword(
                          email: widget.data['email'], isOtp: false);
                    }
                  }
                : null,
            textAlign: TextAlign.center,
          );
        },
      ),
    );
  }
}

Stream<String> countdownStream(Duration duration) async* {
  int totalSeconds = duration.inSeconds;

  while (totalSeconds >= 0) {
    final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
    yield "($minutes m $seconds s)";
    await Future.delayed(const Duration(seconds: 1));
    totalSeconds--;
  }
}
