// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:truee_balance_app/core/themes/app_colors.dart';
// import 'package:truee_balance_app/core/utils/app_constants.dart';

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
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';

Future<void> downloadPdfFile(String url, String fileName) async {
  try {
    debugPrint("Downloading from: $url");
    Directory? dir;
    if (Platform.isAndroid) {
      dir = Directory('/storage/emulated/0/Download');
      if (!dir.existsSync()) {
        dir = await getExternalStorageDirectory();
      }
    } else {
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
    EasyLoading.showSuccess("savedToDownloads".tr());
    debugPrint("${"fileDownLoadedTo".tr()} $savePath");
  } catch (e) {
    EasyLoading.dismiss();
    EasyLoading.showError("downloadFailed".tr());
    debugPrint("${"downloadFailed".tr()} $e");
  }
}
