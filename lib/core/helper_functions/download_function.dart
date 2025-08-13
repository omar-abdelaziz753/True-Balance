import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';

// Future<void> downloadPdfFile(String url, String fileName) async {
//   try {
//     if (Platform.isAndroid) {
//       if (Platform.isAndroid && (await Permission.storage.isDenied)) {
//         var status = await Permission.storage.request();
//         if (!status.isGranted) {
//           debugPrint("Storage permission denied");
//           EasyLoading.showError("Permission denied");
//           return;
//         }
//       }

//       if (Platform.isAndroid &&
//           await Permission.manageExternalStorage.isDenied) {
//         var manageStatus = await Permission.manageExternalStorage.request();
//         if (!manageStatus.isGranted) {
//           debugPrint("Manage External Storage permission denied");
//           EasyLoading.showError("Permission denied");
//           return;
//         }
//       }
//     }

//     Directory dir = Platform.isAndroid
//         ? (await getExternalStorageDirectory())!
//         : await getApplicationDocumentsDirectory();

//     String savePath = "${dir.path}/$fileName";

//     Dio dio = Dio();
//     await dio.download(
//       url,
//       savePath,
//       onReceiveProgress: (received, total) {
//         EasyLoading.instance
//           ..indicatorType = EasyLoadingIndicatorType.fadingCircle
//           ..loadingStyle = EasyLoadingStyle.custom
//           ..indicatorSize = 50.sp
//           ..radius = AppConstants.borderRadius
//           ..backgroundColor = AppColors.neutralColor100
//           ..indicatorColor = AppColors.primaryColor900
//           ..textColor = Colors.black
//           ..maskColor = Colors.black.withValues(alpha: 0.5)
//           ..progressColor = AppColors.primaryColor900
//           ..userInteractions = false;

//         if (total != -1) {
//           double progress = received / total;
//           EasyLoading.showProgress(
//             progress,
//             status: 'Downloading... ${(progress * 100).toStringAsFixed(0)}%',
//             maskType: EasyLoadingMaskType.clear,
//           );
//         }
//       },
//     );

//     EasyLoading.dismiss();
//     EasyLoading.showSuccess("Downloaded Successfully");
//     debugPrint("File downloaded to: $savePath");
//   } catch (e) {
//     EasyLoading.dismiss();
//     EasyLoading.showError("Download failed");
//     debugPrint("Download failed: $e");
//   }
// }
Future<void> downloadPdfFile(String url, String fileName) async {
  try {
    Directory? dir;

    if (Platform.isAndroid) {
      // Use public Downloads folder on Android
      dir = Directory('/storage/emulated/0/Download');
      if (!dir.existsSync()) {
        dir = await getExternalStorageDirectory(); // fallback to app dir
      }
    } else {
      // iOS - App documents directory
      dir = await getApplicationDocumentsDirectory();
    }

    String savePath = "${dir!.path}/$fileName";

    Dio dio = Dio();
    await dio.download(
      url,
      savePath,
      onReceiveProgress: (received, total) {
        EasyLoading.instance
          ..indicatorType = EasyLoadingIndicatorType.fadingCircle
          ..loadingStyle = EasyLoadingStyle.custom
          ..indicatorSize = 50.sp
          ..radius = AppConstants.borderRadius
          ..backgroundColor = AppColors.neutralColor100
          ..indicatorColor = AppColors.primaryColor900
          ..textColor = Colors.black
          ..maskColor = Colors.black.withValues(alpha: 0.5)
          ..progressColor = AppColors.primaryColor900
          ..userInteractions = false;

        if (total != -1) {
          double progress = received / total;
          EasyLoading.showProgress(
            progress,
            status: 'Downloading... ${(progress * 100).toStringAsFixed(0)}%',
            maskType: EasyLoadingMaskType.clear,
          );
        }
      },
    );

    EasyLoading.dismiss();
    EasyLoading.showSuccess("Saved to Downloads");
    debugPrint("File downloaded to: $savePath");
  } catch (e) {
    EasyLoading.dismiss();
    EasyLoading.showError("Download failed");
    debugPrint("Download failed: $e");
  }
}
