import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/helper_functions/flutter_toast.dart';
import 'package:truee_balance_app/core/services/di/dependency_injection.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';
import 'package:truee_balance_app/core/widgets/text_field/custom_text_form_field_widget.dart';
import 'package:truee_balance_app/features/therapist/treatment_details_for_therapists/bloc/cubit/treatment_details_for_therapist_cubit.dart';
import 'package:truee_balance_app/features/therapist/treatment_details_for_therapists/data/model/treatment_sessions_response_for_therapists.dart';
import 'package:truee_balance_app/features/user/add%20session/presentation/widgets/details_row_widget.dart';

class SessionsDetailsTherapists extends StatelessWidget {
  const SessionsDetailsTherapists(
      {super.key, required this.session, required this.index});
  final TreatmentSession session;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor900,
      appBar: CustomBasicAppBar(
        leading: BackButton(
          color: AppColors.neutralColor100,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: '${'Session'.tr()} ${index + 1}',
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
          spacing: 15.sp,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12.sp),
              decoration: BoxDecoration(
                color: AppColors.neutralColor100,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: AppColors.neutralColor1000.withAlpha(20),
                  width: 1.w,
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 2.h),
                    blurRadius: 8.r,
                    color: Colors.black.withAlpha(20),
                  ),
                ],
              ),
              child: Column(
                spacing: 10.sp,
                children: [
                  DetailsRowWidget(
                      label: 'sessionData'.tr(), value: session.date!),
                  DetailsRowWidget(
                      label: 'sessionTime'.tr(), value: session.time!),
                ],
              ),
            ),
            if (session.status != "completed") ...[
              const Spacer(),
              CustomButtonWidget(
                text: 'Completed'.tr(),
                onPressed: () {
                  _showRatingBottomSheet(context, session.id!, index);
                },
              )
            ]
          ],
        ),
      ),
    );
  }
}

// void _showRatingBottomSheet(BuildContext context, int id , int index)  {
//   final TextEditingController commentController = TextEditingController();
//   double rating = 0;

//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     backgroundColor: Colors.transparent,
//     builder: (_) {
//       return BlocProvider(
//         create: (_) => TreatmentDetailsForTherapistCubit(getIt()),
//         child: StatefulBuilder(
//           builder: (statefulContext, setState) {
//             return BlocListener<TreatmentDetailsForTherapistCubit,
//                 TreatmentDetailsForTherapistState>(
//               listener: (listenerContext, state) {
//                 if (state is RateSessionSuccessState) {
//                   Navigator.pop(listenerContext);
//                   Navigator.pop(listenerContext , index);
//                   ScaffoldMessenger.of(listenerContext).showSnackBar(
//                     SnackBar(
//                       content: Text('ratingSubmittedSuccessfully'.tr()),
//                       backgroundColor: AppColors.primaryColor800,
//                     ),
//                   );
//                 } else if (state is RateSessionFailureState) {
//                   ScaffoldMessenger.of(listenerContext).showSnackBar(
//                     SnackBar(
//                       content: Text('failedToSubmitRating'.tr()),
//                       backgroundColor: Colors.red,
//                     ),
//                   );
//                 }
//               },
//               child: CustomSharedBottomSheetReview(
//                 title: 'rateThisSession'.tr(),
//                 nameOfFiled: 'yourComment'.tr(),
//                 hintText: 'writeYourFeedBackHere'.tr(),
//                 buttonText1: 'Submit'.tr(),
//                 buttonText2: 'Cancel'.tr(),
//                 initialRating: rating,
//                 commentController: commentController,
//                 onRatingChanged: (value) {
//                   setState(() {
//                     rating = value;
//                   });
//                 },
//                 onEditPressed: () {
//                   if (rating == 0) {
//                     customToast(
//                       msg: 'pleaseselectarating'.tr(),
//                       color: Colors.red,
//                     );
//                     return;
//                   }

//                   if (commentController.text.trim().isEmpty) {
//                     customToast(
//                       msg: 'pleaseenteracomment'.tr(),
//                       color: Colors.red,
//                     );
//                     return;
//                   }

//                   statefulContext
//                       .read<TreatmentDetailsForTherapistCubit>()
//                       .rateSession(
//                         id: id,
//                         number: rating,
//                         text: commentController.text.trim(),
//                       );
//                 },
//                 onCancelPressed: () {
//                   Navigator.pop(statefulContext);
//                 },
//               ),
//             );
//           },
//         ),
//       );
//     },
//   );
// }

void _showRatingBottomSheet(BuildContext context, int id, int index) {
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
              child: CustomSharedBottomSheetReview(
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
                        recoveryRate:
                            rating.toString(), // convert rating to string
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

class CustomSharedBottomSheetReview extends StatelessWidget {
  final String title;
  final String nameOfFiled;
  final String? hintText;
  final String? buttonText1;
  final String? buttonText2;
  final double initialRating;
  final void Function(double) onRatingChanged;
  final TextEditingController commentController;
  final VoidCallback onEditPressed;
  final VoidCallback onCancelPressed;
  final VoidCallback onAttachFilePressed;
  final String fileName;
  final bool? isEdit;

  const CustomSharedBottomSheetReview({
    super.key,
    required this.title,
    required this.buttonText1,
    required this.buttonText2,
    required this.nameOfFiled,
    required this.initialRating,
    required this.onRatingChanged,
    required this.commentController,
    required this.onEditPressed,
    required this.onCancelPressed,
    required this.onAttachFilePressed,
    required this.fileName,
    this.hintText,
    this.isEdit = false,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        width: double.infinity,
        padding:
            EdgeInsets.only(left: 18.w, right: 18.w, bottom: 34.h, top: 12.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24.r),
            topLeft: Radius.circular(24.r),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title
            Center(
              child: Text(
                title,
                style: Styles.heading4.copyWith(
                  color: AppColors.neutralColor1000,
                ),
              ),
            ),

            12.verticalSpace,

            /// Divider
            Divider(
              color: AppColors.neutralColor300,
              thickness: 1.w,
            ),

            24.verticalSpace,

            /// Rating Bar
            // RatingBar.builder(
            //   initialRating: initialRating,
            //   minRating: 1,
            //   direction: Axis.horizontal,
            //   allowHalfRating: true,
            //   itemCount: 5,
            //   itemSize: 60.sp,
            //   itemPadding: EdgeInsets.symmetric(horizontal: 5.w),
            //   itemBuilder: (context, _) => Center(
            //     child: Icon(
            //       Icons.star,
            //       color: AppColors.yellowColor100,
            //       size: 60.sp,
            //     ),
            //   ),
            //   unratedColor: AppColors.neutralColor300,
            //   glowColor: AppColors.neutralColor300,
            //   onRatingUpdate: onRatingChanged,
            // ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Label with current value
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'recoveryRate'.tr(),
                      style: Styles.highlightEmphasis.copyWith(
                        color: AppColors.neutralColor1000,
                      ),
                    ),
                    Text(
                      '${initialRating.toInt()} / 100',
                      style: Styles.highlightEmphasis.copyWith(
                        color: AppColors.primaryColor700,
                      ),
                    ),
                  ],
                ),

                Slider(
                  value: initialRating,
                  min: 1,
                  max: 100,
                  // divisions: 99, // for stepping 1-by-1
                  label: initialRating.toInt().toString(),
                  onChanged: onRatingChanged,
                  activeColor: AppColors.primaryColor700,
                  inactiveColor: AppColors.neutralColor300,
                ),
              ],
            ),

            24.verticalSpace,

            /// Comment Label
            Text(
              nameOfFiled,
              style: Styles.highlightEmphasis.copyWith(
                color: AppColors.neutralColor1000,
              ),
            ),

            8.verticalSpace,

            /// Comment TextField
            CustomTextFormFieldWidget(
              controller: commentController,
              borderColor: isEdit == false
                  ? AppColors.neutralColor600
                  : AppColors.neutralColor1000,
              borderWidth: 1.w,
              hintText: hintText,
              hintStyle: isEdit == false
                  ? Styles.contentRegular
                      .copyWith(color: AppColors.neutralColor600)
                  : Styles.contentRegular
                      .copyWith(color: AppColors.neutralColor1000),
              maxLines: 6,
            ),

            16.verticalSpace,

            /// Attach File Button
            GestureDetector(
              onTap: onAttachFilePressed,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryColor700),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  children: [
                    Icon(Icons.attach_file, color: AppColors.primaryColor700),
                    8.horizontalSpace,
                    Expanded(
                      child: Text(
                        fileName.isEmpty ? 'attachAFile'.tr() : fileName,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.contentRegular.copyWith(
                          color: fileName.isEmpty
                              ? AppColors.neutralColor600
                              : AppColors.primaryColor700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            24.verticalSpace,

            /// Buttons
            Row(
              spacing: 18.w,
              children: [
                Expanded(
                  child: CustomButtonWidget(
                    onPressed: onEditPressed,
                    text: buttonText1,
                    fontSize: 16.sp,
                    color: AppColors.primaryColor700,
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                ),
                Expanded(
                  child: CustomButtonWidget(
                    onPressed: onCancelPressed,
                    text: buttonText2,
                    fontSize: 16.sp,
                    color: Colors.white,
                    textColor: AppColors.primaryColor700,
                    borderSide: BorderSide(
                      width: 1.w,
                      color: AppColors.primaryColor700,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
