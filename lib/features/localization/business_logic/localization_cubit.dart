import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truee_balance_app/core/cache_helper/cache_helper.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationInitial());
  static LocalizationCubit get(context) => BlocProvider.of(context);

  Future<void> changeLanguage(
      {required context, required lang, required country}) async {
    emit(LocalizationLoading());
    var localization = EasyLocalization.of(context);
    await localization!.setLocale(Locale(lang, country));

    if (lang == 'en') {
      await CacheHelper.changeLanguageToEn();
      if (kDebugMode) {
        print("Language changed to English and saved in cache: ${CacheHelper.getCurrentLanguage()}");
      }
    } else {
      await CacheHelper.changeLanguageToAr();
      // isEnglish = false;
      if (kDebugMode) {
        print("Language changed to Arabic and saved in cache: ${CacheHelper.getCurrentLanguage()}");
      }
    }
    emit(LocalizationChange());
  }
}
