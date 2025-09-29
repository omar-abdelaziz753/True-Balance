import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';

class PleaseLoginButtom extends StatelessWidget {
  const PleaseLoginButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomButtonWidget(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        text: "Pleaselogin".tr(),
        onPressed: () {
          context.pushNamed(Routes.loginScreen);
        },
      ),
    );
  }
}
