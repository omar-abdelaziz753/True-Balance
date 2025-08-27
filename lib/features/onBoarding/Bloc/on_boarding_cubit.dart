import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truee_balance_app/core/themes/assets.dart';
import 'package:truee_balance_app/features/onBoarding/Bloc/on_boarding_states.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates> {
  OnBoardingCubit() : super(OnBoardingInitialState());

  int onBoardingIndex = 0;
  void changeOnBoardingIndex(int index) {
    onBoardingIndex = index;

    emit(OnBoardingNextState());
  }

  PageController pageController = PageController(initialPage: 0);

  List<String> onBoardingImageUrls = [
    Assets.assetsImagesPngOnBoarding1,
    Assets.assetsImagesPngOnBoarding2,
    Assets.assetsImagesPngOnBoarding3
  ];

  List<String> onBoardingTitleStart = [
    'bookYour'.tr(),
    'uploadStoreYour'.tr(),
    'followYourTreatmentPlanEasily'.tr(),
  ];

  List<String> onBoardingTitleHighlighted = [
    'sessionInstantly'.tr(),
    'reports'.tr(),
    'easily'.tr(),
  ];

  List<String> onBoardingDescriptions = [
    'findtheright'.tr(),
    'keepall'.tr(),
    'accessyourpersonalized'.tr(),
  ];
}
