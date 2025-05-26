import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';
import 'package:truee_balance_app/core/widgets/container/custom_divider_widget.dart';
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
            print('back');
          },
        ),
        // leading: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back, color: AppColors.neutralColor100,),),
        title: 'My Tickets',
        backgroundColor: AppColors.primaryColor900,
        svgAsset: 'assets/images/svg/bg_image.svg',
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(18.sp),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r),
              ),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 16,
                      padding: EdgeInsets.only(
                        top: 0,
                        bottom: 100.h,
                      ),
                      separatorBuilder: (context, index) => const CustomDividerWidget(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 16.h,
                          ),
                          child: const CustomRowInMyTicketsWidget(
                            ticketNumber: 'Ticket No. #TICKET-12987',
                            message: "I'm having trouble logging in to my account. I'm getting an error message stating that the information is incorrect, even though I've verified it. Please help as soon as possible.",
                          ),
                        );
                      },
                    ),
                  ),
                );
              }
            ),
          ),

          Positioned(
            left: 18.w,
            right: 18.w,
            bottom: 32.h,
            child: CustomButtonWidget(
              onPressed: () => context.pushNamed(Routes.openANewTicketScreen),
              padding: EdgeInsets.symmetric(
                vertical: 12.h,
              ),
              text: 'Open A New Ticket',
              textStyle: Styles.contentEmphasis.copyWith(
                color: AppColors.neutralColor100,
              ),
            ),
          )
        ],
      ),
    );
  }
}