// // import 'package:firebase_messaging/firebase_messaging.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:hrfa_app/core/themes/app_colors.dart';
// // import 'package:top_snackbar_flutter/custom_snack_bar.dart';
// // import 'package:top_snackbar_flutter/top_snack_bar.dart';
// //
// // notificationSnackBar(
// //     {required context, required message, required RemoteMessage event}) {
// //   showTopSnackBar(
// //     Overlay.of(context),
// //     CustomSnackBar.success(
// //       message: "$message\n ${event.data["body"] ?? ""}",
// //       backgroundColor: AppColors.primaryColor800,
// //
// //       messagePadding: EdgeInsets.only(left: 5.w),
// //       icon: Padding(
// //           padding: EdgeInsetsDirectional.symmetric(horizontal: 5.w),
// //           child: const Icon(Icons.notifications)),
// //     ),
// //     dismissDirection: [
// //       DismissDirection.vertical,
// //       DismissDirection.horizontal,
// //     ],
// //     curve: Curves.fastLinearToSlowEaseIn,
// //     displayDuration: const Duration(seconds: 3),
// //     dismissType: DismissType.onTap,
// //   );
// // }
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// void notificationSnackBar({
//   required BuildContext context,
//   required String? message,
//   required RemoteMessage event
// }) {
//   // Extract notification data
//   final title = message ?? event.notification?.title ?? "New Notification";
//   final body = event.data["body"] ?? event.notification?.body ?? "";
//   final imageUrl = event.data["image"] ?? "";
//
//   // Show custom top snackbar
//   showTopSnackBar(
//     Overlay.of(context),
//     Material(
//       elevation: 6,
//       shadowColor: Colors.black26,
//       borderRadius: BorderRadius.circular(12.r),
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12.r),
//           border: Border.all(color: AppColors.primaryColor200.withOpacity(0.3), width: 1),
//         ),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Notification Icon with bubble effect
//             Container(
//               height: 42.h,
//               width: 42.w,
//               decoration: BoxDecoration(
//                 color: AppColors.primaryColor100,
//                 shape: BoxShape.circle,
//               ),
//               child: Center(
//                 child: Icon(
//                   Icons.notifications_active,
//                   color: AppColors.primaryColor800,
//                   size: 22.sp,
//                 ),
//               ),
//             ),
//             SizedBox(width: 12.w),
//
//             // Notification Content
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   // Title
//                   Text(
//                     title,
//                     style: TextStyle(
//                       fontSize: 16.sp,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black87,
//                     ),
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   SizedBox(height: 4.h),
//
//                   // Body
//                   if (body.isNotEmpty) ...[
//                     Text(
//                       body,
//                       style: TextStyle(
//                         fontSize: 14.sp,
//                         color: Colors.black54,
//                         height: 1.2,
//                       ),
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     SizedBox(height: 4.h),
//                   ],
//
//                   // Image if available
//                   if (imageUrl.isNotEmpty) ...[
//                     SizedBox(height: 4.h),
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(8.r),
//                       child: Image.network(
//                         imageUrl,
//                         height: 120.h,
//                         width: double.infinity,
//                         fit: BoxFit.cover,
//                         errorBuilder: (context, error, stackTrace) =>
//                             Container(height: 0),
//                       ),
//                     ),
//                   ],
//
//                   // Time indicator
//                   SizedBox(height: 4.h),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Text(
//                         "Now",
//                         style: TextStyle(
//                           fontSize: 11.sp,
//                           color: Colors.black38,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//
//             // Close button
//             GestureDetector(
//               onTap: () {
//                 // Find the closest snack bar in the overlay and close it
//                 final OverlayState overlay = Overlay.of(context);
//                 final OverlayEntry? entry =
//                 overlay.mounted ? ModalRoute.of(context)?.overlayEntries.lastOrNull : null;
//                 if (entry != null) {
//                   entry.remove();
//                 }
//               },
//               child: Padding(
//                 padding: EdgeInsets.only(left: 8.w),
//                 child: Icon(
//                   Icons.close,
//                   size: 16.sp,
//                   color: Colors.black45,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//     dismissDirection: [
//       DismissDirection.up,
//       DismissDirection.horizontal,
//     ],
//     curve: Curves.easeOutQuart,
//     displayDuration: const Duration(seconds: 4),
//     dismissType: DismissType.onSwipe,
//     onTap: () {
//       // Handle notification tap - you can navigate to a specific screen based on data
//       if (event.data.containsKey("route")) {
//         final route = event.data["route"];
//         Navigator.of(context).pushNamed(route);
//       }
//     },
//   );
// }