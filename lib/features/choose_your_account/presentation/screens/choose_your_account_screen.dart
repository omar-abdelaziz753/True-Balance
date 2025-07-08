import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';
import 'package:truee_balance_app/features/choose_your_account/business_logic/cubit/chosse_account_cubit.dart';
import 'package:truee_balance_app/features/choose_your_account/presentation/widgets/choose_account_widget.dart';

class ChooseYourAccountScreen extends StatelessWidget {
  const ChooseYourAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chosseaccountcubit = context.read<ChosseAccountCubit>();
    return Scaffold(
      backgroundColor: AppColors.primaryColor900,
      appBar: CustomBasicAppBar(
        title: 'chooseYouraccounttype'.tr(),
        backgroundColor: AppColors.primaryColor900,
        svgAsset: 'assets/images/svg/bg_image.svg',
      ),
      body: Container(
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
            BlocBuilder<ChosseAccountCubit, ChosseAccountState>(
              buildWhen: (previous, current) =>
                  current is ChosseAccountChangeState,
              builder: (context, state) {
                return Column(
                  spacing: 12.h,
                  children: [
                    ChooseAccountWidget(
                      isSelected: chosseaccountcubit.selectd == 1,
                      onTap: () {
                        chosseaccountcubit.changeSelected(1);
                      },
                      title: 'Patient '.tr(),
                    ),
                    12.horizontalSpace,
                    ChooseAccountWidget(
                      isSelected: chosseaccountcubit.selectd == 0,
                      onTap: () {
                        chosseaccountcubit.changeSelected(0);
                      },
                      title: 'therapist'.tr(),
                    ),
                    ChooseAccountWidget(
                      isSelected: chosseaccountcubit.selectd == 2,
                      onTap: () {
                        chosseaccountcubit.changeSelected(2);
                      },
                      title: 'Doctors'.tr(),
                    )
                  ],
                );
              },
            ),
            const Spacer(),
            CustomButtonWidget(
              text: 'next'.tr(),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
