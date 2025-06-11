import 'package:easy_localization/easy_localization.dart';
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
    } else {
      await CacheHelper.changeLanguageToAr();
      // isEnglish = false;
    }
    emit(LocalizationChange());
  }
}
