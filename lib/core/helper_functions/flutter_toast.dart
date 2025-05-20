import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

void customToast({
  required String msg,
  required var color,
  int? time,
}) =>
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: time ?? 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0.sp,
    );

void showCustomSnackbar({
  required BuildContext context,
  required String msg,
  required Color color,
  int? time,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        msg,
        style: TextStyle(color: Colors.white, fontSize: 16.0.sp),
      ),
      backgroundColor: color,
      duration: Duration(seconds: time ?? 10), // Default to 10 seconds
    ),
  );
}