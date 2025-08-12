import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:truee_balance_app/core/helper_functions/download_function.dart';
import 'package:truee_balance_app/core/helper_functions/flutter_toast.dart';
import 'package:truee_balance_app/core/services/di/dependency_injection.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/assets.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:truee_balance_app/core/widgets/button/custom_button_widget.dart';
import 'package:truee_balance_app/core/widgets/rating%20dailoug/rating_dailoug.dart';
import 'package:truee_balance_app/features/user/add%20session/presentation/widgets/details_row_widget.dart';
import 'package:truee_balance_app/features/user/session%20details/bloc/cubit/session_details_cubit.dart';
import 'package:truee_balance_app/features/user/session%20details/data/model/treatment_plan_detail.dart';

class SessionDetails extends StatelessWidget {
  const SessionDetails({super.key, required this.session});
  final Session session;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor900,
      appBar: CustomBasicAppBar(
        title: "Session ${session.index! + 1}",
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
                  DetailsRowWidget(label: "Session data", value: session.date),
                  DetailsRowWidget(label: "Session time", value: session.time),
                ],
              ),
            ),
            if (session.status == "completed") ...[
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
                  spacing: 12.sp,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Notes",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      session.notes ?? "",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 8.sp),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            session.file ?? "",
                            style: Styles.contentEmphasis.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        await downloadPdfFile(session.file ?? "",
                            Uri.parse(session.file ?? "").pathSegments.last);
                      },
                      icon: Row(
                        children: [
                          Icon(
                            Icons.download_outlined,
                            size: 20.sp,
                            color: AppColors.primaryColor800,
                          ),
                          Text(
                            'download'.tr(),
                            style: Styles.contentEmphasis.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.primaryColor800,
                                fontSize: 12.sp),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              CustomButtonWidget(
                text: 'Add Rating',
                onPressed: () {
                  _showRatingBottomSheet(context, session.id);
                },
              )
            ]
          ],
        ),
      ),
    );
  }
}

// void _showRatingBottomSheet(BuildContext context, int id) {
//   final TextEditingController commentController = TextEditingController();
//   double rating = 0;

//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     backgroundColor: Colors.transparent,
//     builder: (_) {
//       return BlocProvider(
//         create: (_) => SessionDetailsCubit(getIt()),
//         child: StatefulBuilder(
//           builder: (statefulContext, setState) {
//             return BlocListener<SessionDetailsCubit, SessionDetailsState>(
//               listener: (listenerContext, state) {
//                 if (state is RateSessionSuccessState) {
//                   Navigator.pop(listenerContext);
//                   ScaffoldMessenger.of(listenerContext).showSnackBar(
//                     SnackBar(
//                       content: const Text("Rating submitted successfully!"),
//                       backgroundColor: AppColors.primaryColor800,
//                     ),
//                   );
//                 } else if (state is RateSessionFailureState) {
//                   ScaffoldMessenger.of(listenerContext).showSnackBar(
//                     const SnackBar(
//                       content: Text("Failed to submit rating"),
//                       backgroundColor: Colors.red,
//                     ),
//                   );
//                 }
//               },
//               child: CustomSharedBottomSheetReview(
//                 title: "Rate This Session",
//                 nameOfFiled: "Your Comment",
//                 hintText: "Write your feedback here...",
//                 buttonText1: "Submit",
//                 buttonText2: "Cancel",
//                 initialRating: rating,
//                 commentController: commentController,
//                 onRatingChanged: (value) {
//                   setState(() {
//                     rating = value;
//                   });
//                 },
//                 onEditPressed: () {
//                   statefulContext.read<SessionDetailsCubit>().rateSession(
//                         id: id,
//                         number: rating,
//                         text: commentController.text,
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
void _showRatingBottomSheet(BuildContext context, int id) {
  final TextEditingController commentController = TextEditingController();
  double rating = 0;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) {
      return BlocProvider(
        create: (_) => SessionDetailsCubit(getIt()),
        child: StatefulBuilder(
          builder: (statefulContext, setState) {
            return BlocListener<SessionDetailsCubit, SessionDetailsState>(
              listener: (listenerContext, state) {
                if (state is RateSessionSuccessState) {
                  Navigator.pop(listenerContext);
                  ScaffoldMessenger.of(listenerContext).showSnackBar(
                    SnackBar(
                      content: const Text("Rating submitted successfully!"),
                      backgroundColor: AppColors.primaryColor800,
                    ),
                  );
                } else if (state is RateSessionFailureState) {
                  ScaffoldMessenger.of(listenerContext).showSnackBar(
                    const SnackBar(
                      content: Text("Failed to submit rating"),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: CustomSharedBottomSheetReview(
                title: "Rate This Session",
                nameOfFiled: "Your Comment",
                hintText: "Write your feedback here...",
                buttonText1: "Submit",
                buttonText2: "Cancel",
                initialRating: rating,
                commentController: commentController,
                onRatingChanged: (value) {
                  setState(() {
                    rating = value;
                  });
                },
                onEditPressed: () {
                  // ✅ Validation
                  if (rating == 0) {
                    customToast(
                      msg: "Please select a rating",
                      color: Colors.red,
                    );
                    return;
                  }

                  if (commentController.text.trim().isEmpty) {
                    customToast(
                      msg: "Please enter a comment",
                      color: Colors.red,
                    );
                    return;
                  }

                  // ✅ If passed, submit
                  statefulContext.read<SessionDetailsCubit>().rateSession(
                        id: id,
                        number: rating,
                        text: commentController.text.trim(),
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
