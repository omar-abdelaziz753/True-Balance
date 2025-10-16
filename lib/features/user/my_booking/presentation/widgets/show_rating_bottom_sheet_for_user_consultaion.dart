import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truee_balance_app/core/helper_functions/flutter_toast.dart';
import 'package:truee_balance_app/core/services/di/dependency_injection.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/widgets/rating%20dailoug/rating_dailoug.dart';
import 'package:truee_balance_app/features/user/my_booking/bloc/mybook_cubit.dart';

Future<bool> showRatingBottomSheetForUserConsultaion(
    BuildContext context, int id) async {
  final TextEditingController commentController = TextEditingController();
  double rating = 0;

  final result = await showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) {
      return BlocProvider(
        create: (_) => MybookCubit(
          getIt(),
        ),
        child: StatefulBuilder(
          builder: (statefulContext, setState) {
            return BlocListener<MybookCubit, MybookState>(
              listener: (listenerContext, state) {
                if (state is AddRateSuccess) {
                  Navigator.pop(listenerContext, true); 
                  ScaffoldMessenger.of(listenerContext).showSnackBar(
                    SnackBar(
                      content: Text('ratingSubmittedSuccessfully'.tr()),
                      backgroundColor: AppColors.primaryColor800,
                    ),
                  );
                } else if (state is AddRateFailure) {
                  Navigator.pop(listenerContext, false); 
                  ScaffoldMessenger.of(listenerContext).showSnackBar(
                    SnackBar(
                      content: Text('failedToSubmitRating'.tr()),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: CustomSharedBottomSheetReview(
                title: 'rateThisConsultation'.tr(),
                nameOfFiled: 'yourComment'.tr(),
                hintText: 'writeYourFeedBackHere'.tr(),
                buttonText1: 'Submit'.tr(),
                buttonText2: 'Cancel'.tr(),
                initialRating: rating,
                commentController: commentController,
                onRatingChanged: (value) {
                  setState(() {
                    rating = value;
                  });
                },
                onEditPressed: () {
                  if (rating == 0) {
                    customToast(
                      msg: 'pleaseselectarating'.tr(),
                      color: Colors.red,
                    );
                    return;
                  }

                  if (commentController.text.trim().isEmpty) {
                    customToast(
                      msg: 'pleaseenteracomment'.tr(),
                      color: Colors.red,
                    );
                    return;
                  }

                  statefulContext.read<MybookCubit>().addRateConsultation(
                        consultationId: id,
                        userRate: rating.toInt(),
                        userMessage: commentController.text.trim(),
                      );
                },
                onCancelPressed: () {
                  Navigator.pop(statefulContext, false); 
                },
              ),
            );
          },
        ),
      );
    },
  );

  return result ?? false;
}
