import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truee_balance_app/core/helper_functions/flutter_toast.dart';
import 'package:truee_balance_app/core/services/di/dependency_injection.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/features/therapist/treatment_details_for_therapists/bloc/cubit/treatment_details_for_therapist_cubit.dart';
import 'package:truee_balance_app/features/therapist/treatment_details_for_therapists/presentation/widgets/shared_buttom_sheet_for_session_theripist.dart';

void showRatingBottomSheetForSession(BuildContext context, int id, int index) {
  final TextEditingController commentController = TextEditingController();
  double rating = 1.0;
  File? pickedFile;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) {
      return BlocProvider(
        create: (_) => TreatmentDetailsForTherapistCubit(getIt()),
        child: StatefulBuilder(
          builder: (statefulContext, setState) {
            return BlocListener<TreatmentDetailsForTherapistCubit,
                TreatmentDetailsForTherapistState>(
              listener: (listenerContext, state) {
                if (state is RateSessionSuccessState) {
                  Navigator.pop(listenerContext);
                  Navigator.pop(listenerContext, index);
                  ScaffoldMessenger.of(listenerContext).showSnackBar(
                    SnackBar(
                      content: Text('ratingSubmittedSuccessfully'.tr()),
                      backgroundColor: AppColors.primaryColor800,
                    ),
                  );
                } else if (state is RateSessionFailureState) {
                  ScaffoldMessenger.of(listenerContext).showSnackBar(
                    SnackBar(
                      content: Text('failedToSubmitRating'.tr()),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: CustomSharedBottomSheetReviewForSession(
                title: 'rateThisSession'.tr(),
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
                onAttachFilePressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles();
                  if (result != null && result.files.single.path != null) {
                    setState(() {
                      pickedFile = File(result.files.single.path!);
                    });
                  }
                },
                fileName: pickedFile?.path.split('/').last ?? '',
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

                  if (pickedFile == null) {
                    customToast(
                      msg: 'pleaseattachafile'.tr(),
                      color: Colors.red,
                    );
                    return;
                  }

                  statefulContext
                      .read<TreatmentDetailsForTherapistCubit>()
                      .rateSession(
                        id: id,
                        file: pickedFile!,
                        notes: commentController.text.trim(),
                        recoveryRate: rating.toString(),
                      );
                },
                onCancelPressed: () {
                  Navigator.pop(statefulContext);
                },
              ),
            );
          },
        ),
      );
    },
  );
}
