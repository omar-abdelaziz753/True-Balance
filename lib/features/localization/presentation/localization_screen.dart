import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/features/localization/business_logic/localization_cubit.dart';

void showLocalizationBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.neutralColor100,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (context) {
      return BlocProvider(
        create: (context) => LocalizationCubit(),
        child: BlocBuilder<LocalizationCubit, LocalizationState>(
          builder: (context, state) {
            LocalizationCubit localizationCubit =
                LocalizationCubit.get(context);
            String currentLocale = context.locale.toString();
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'language'.tr(),
                    style: Styles.heading3.copyWith(
                      color: AppColors.neutralColor900,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  LanguageOption(
                    label: 'العربية'.tr(),
                    selected: currentLocale == 'ar_EG',
                    onTap: () {
                      localizationCubit
                          .changeLanguage(
                              context: context, lang: 'ar', country: 'EG')
                          .then((value) => Phoenix.rebirth(context));
                    },
                  ),
                  SizedBox(height: 10.h),
                  LanguageOption(
                    label: 'English'.tr(),
                    selected: currentLocale == 'en_UK',
                    onTap: () {
                      localizationCubit
                          .changeLanguage(
                              context: context, lang: 'en', country: 'UK')
                          .then((value) => Phoenix.rebirth(context));
                    },
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}

class LanguageOption extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const LanguageOption({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.w),
          color: selected ? Colors.white.withValues(alpha: 0.9) : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 2.r,
              blurRadius: 5.r,
            )
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: Styles.highlightStandard.copyWith(
                color: selected ? AppColors.primaryColor900 : Colors.black,
                fontWeight: selected ? FontWeight.bold : FontWeight.w500,
              ),
            ),
            if (selected)
              Icon(
                Icons.check_circle,
                color: AppColors.primaryColor900,
                size: 24.sp,
              ),
          ],
        ),
      ),
    );
  }
}
