import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';
import 'package:truee_balance_app/core/widgets/container/custom_divider_widget.dart';
import 'package:truee_balance_app/features/user/technical_support/bloc/technical_support_cubit.dart';
import 'package:truee_balance_app/features/user/technical_support/presentation/widgets/custom_row_in_my_tickets_widget.dart';

class MyTicketsScreen extends StatelessWidget {
  const MyTicketsScreen({super.key});

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
        title: 'myTickets'.tr(),
        backgroundColor: AppColors.primaryColor900,
        svgAsset: 'assets/images/svg/bg_image.svg',
      ),
      body: BlocBuilder<TechnicalSupportCubit, TechnicalSupportState>(
        builder: (context, state) {
          final cubit = context.read<TechnicalSupportCubit>();

          return Column(
            children: [
              Expanded(
                child: Container(
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
                      if (state is GetAllTicketsLoadingState)
                        const Expanded(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      else ...[
                        Expanded(
                          child: ListView.separated(
                            controller: cubit.allTicketsScrollController,
                            itemCount: cubit
                                .allTicketsDataModel!.data!.tickets!.length,
                            padding: EdgeInsets.only(
                              top: 0,
                              bottom: 16.h,
                            ),
                            separatorBuilder: (context, index) =>
                                const CustomDividerWidget(),
                            itemBuilder: (context, index) {
                              final ticket = cubit
                                  .allTicketsDataModel!.data!.tickets![index];
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 16.h),
                                child: InkWell(
                                  onTap: () {
                                    context.pushNamed(
                                      Routes.chatScreen,
                                      arguments: ticket.id,
                                    );
                                  },
                                  child: CustomRowInMyTicketsWidget(
                                    ticketNumber:
                                        '${'ticketNo'.tr()} #${ticket.id!}',
                                    // message: ticket.title!,
                                    message: (ticket.status ?? '')
                                        .replaceFirstMapped(RegExp(r'^[a-zA-Z]'), (match) => match.group(0)!.toUpperCase()),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        BlocBuilder<TechnicalSupportCubit,
                            TechnicalSupportState>(
                          buildWhen: (previous, current) =>
                              current is TicketsLoadingMore ||
                              current is GetAllTicketsSuccessState,
                          builder: (context, state) {
                            if (state is TicketsLoadingMore) {
                              return const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: CircularProgressIndicator(),
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                        CustomButtonWidget(
                          onPressed: () => context
                              .pushNamed(Routes.openANewTicketScreen)
                              .then((context) {
                            cubit.getAllTickets();
                          }),
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          text: 'openANewTicket'.tr(),
                          textStyle: Styles.contentEmphasis.copyWith(
                            color: AppColors.neutralColor100,
                          ),
                        ),
                      ]
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
