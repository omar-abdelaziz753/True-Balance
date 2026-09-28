// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:true_balance_app/core/themes/app_colors.dart';
// import 'package:true_balance_app/core/utils/app_constants.dart';

// Future<void> downloadPdfFile(String url, String fileName) async {
//   try {
//     PermissionStatus status = await Permission.manageExternalStorage.request();

//     if (!status.isGranted) {
//       EasyLoading.showError("Storage permission denied");
//       return;
//     }

//     Directory? dir;

//     if (Platform.isAndroid) {
//       dir = await getApplicationDocumentsDirectory();
//       if (!dir.existsSync()) {
//         dir = await getExternalStorageDirectory();
//       }
//     } else {
//       dir = await getApplicationDocumentsDirectory();
//     }

//     String savePath = "${dir!.path}/$fileName";

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
//           ..maskColor = Colors.black.withValues(alpha:0.5)
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
//     EasyLoading.showSuccess("Saved to Downloads");
//     debugPrint("File downloaded to: $savePath");
//   } catch (e) {
//     EasyLoading.dismiss();
//     EasyLoading.showError("Download failed");
//     debugPrint("Download failed: $e");
//   }
// }
import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:true_balance_app/core/themes/app_colors.dart';
import 'package:true_balance_app/core/utils/app_constants.dart';

Future<void> downloadPdfFile(String url, String fileName) async {
  try {
    final uri = Uri.tryParse(url);
    assert(
      !kReleaseMode || uri?.scheme == 'https',
      'Download URL must be https in release',
    );
    if (uri == null || (uri.scheme != 'https' && uri.scheme != 'http')) {
      unawaited(EasyLoading.showError("downloadFailed".tr()));
      return;
    }
    // Strip any path components — the server-provided name must never escape
    // the destination directory (path traversal).
    final safeName = Uri.decodeComponent(fileName)
        .split('/')
        .last
        .split('\\')
        .last
        .trim();
    if (safeName.isEmpty || safeName == '.' || safeName == '..') {
      unawaited(EasyLoading.showError("downloadFailed".tr()));
      return;
    }
    if (kDebugMode) debugPrint("Downloading file: $safeName");

    // App-private storage needs no storage permission on any API level
    // (scoped storage compliant — no MANAGE_EXTERNAL_STORAGE required).
    Directory? dir;
    if (Platform.isAndroid) {
      dir =
          await getExternalStorageDirectory() ??
          await getApplicationDocumentsDirectory();
    } else {
      dir = await getApplicationDocumentsDirectory();
    }

    final savePath = "${dir.path}/$safeName";

    Dio dio = Dio();
    await dio.download(
      uri.toString(),
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
          unawaited(
            EasyLoading.showProgress(
              progress,
              status: 'Downloading... ${(progress * 100).toStringAsFixed(0)}%',
              maskType: EasyLoadingMaskType.clear,
            ),
          );
        }
      },
    );

    unawaited(EasyLoading.dismiss());
    unawaited(EasyLoading.showSuccess("savedToDownloads".tr()));
  } catch (e) {
    unawaited(EasyLoading.dismiss());
    unawaited(EasyLoading.showError("downloadFailed".tr()));
    // Never log the URL/path — it can contain PHI-adjacent file locations.
    if (kDebugMode) debugPrint("Download failed: ${e.runtimeType}");
  }
}
