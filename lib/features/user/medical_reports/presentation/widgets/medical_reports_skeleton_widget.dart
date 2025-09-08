import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:truee_balance_app/core/helper_functions/download_function.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/assets.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';

class MediaclReportSkeletonWidget extends StatelessWidget {
  const MediaclReportSkeletonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutralColor900,
      appBar: CustomBasicAppBar(
        leading: BackButton(
          color: AppColors.neutralColor100,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: 'medicalReports'.tr(),
        backgroundColor: AppColors.primaryColor900,
        svgAsset: 'assets/images/svg/bg_image.svg',
      ),
      body: Skeletonizer(
        enabled: true,
        child: Container(
          width: double.infinity,
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
              return ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemCount: 10,
                        separatorBuilder: (BuildContext context, int index) {
                          return 16.verticalSpace;
                        },
                        itemBuilder: (BuildContext context, int index) {
                          final reportsNames = [
                            "Text1.pdf",
                            "Text2.pdf",
                            "Text3.pdf",
                            "Text4.pdf",
                            "Text5.pdf",
                            "Text6.pdf",
                            "Text7.pdf",
                            "Text8.pdf",
                            "Text9.pdf",
                            "Text10.pdf",
                          ];
                          final invoiceUrls = [
                            "https://example.com/report1.pdf",
                            "https://example.com/report2.pdf",
                            "https://example.com/report3.pdf",
                            "https://example.com/report4.pdf",
                            "https://example.com/report5.pdf",
                            "https://example.com/report6.pdf",
                            "https://example.com/report7.pdf",
                            "https://example.com/report8.pdf",
                            "https://example.com/report9.pdf",
                            "https://example.com/report10.pdf",
                          ];
                          return Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.sp,
                              vertical: 8.sp,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.sp),
                              border: Border.all(
                                width: 1.sp,
                                color: AppColors.neutralColor600,
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12.sp),
                                  child: SvgPicture.asset(
                                    Assets.assetsImagesSvgPdfIcon,
                                    height: 36.sp,
                                    width: 36.sp,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 10.sp),
                                Expanded(
                                  child: Text(
                                    reportsNames[index],
                                    style: Styles.contentEmphasis.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                if (invoiceUrls[index].isNotEmpty)
                                  InkWell(
                                    onTap: () async {
                                      await downloadPdfFile(
                                        invoiceUrls[index],
                                        Uri.parse(invoiceUrls[index])
                                            .pathSegments
                                            .last,
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.download_outlined,
                                          size: 20.sp,
                                          color: AppColors.primaryColor900,
                                        ),
                                        Text(
                                          'download'.tr(),
                                          style:
                                              Styles.contentEmphasis.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.primaryColor900,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
