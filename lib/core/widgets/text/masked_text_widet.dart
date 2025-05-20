import 'package:flutter/material.dart';

class MaskedTextWidget extends StatelessWidget {
  const MaskedTextWidget({super.key, required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    /// Determine whether the data is a phone number or an email and mask accordingly
    String maskedData =
        data.contains('@') ? maskEmail(data) : maskPhoneNumber(data);

    return Text(
      maskedData,
      // style: VStyles.bodyLargeBold(context).copyWith(
      //   color: VColors.blackColor,
      // ),
    );
  }

  String maskPhoneNumber(String phoneNumber) {
    /// Assuming the phone number format is consistent and has at least 14 characters
    if (phoneNumber.length > 14) {
      return '${phoneNumber.substring(0, 8)}******${phoneNumber.substring(14)}';
    } else {
      /// Handle the case for shorter phone numbers or unexpected formats
      return phoneNumber;

      /// Or some form of masking as deemed appropriate
    }
  }

  String maskEmail(String email) {
    int atIndex = email.indexOf('@');
    String localPart = email.substring(0, atIndex);
    String gmail = email.substring(atIndex);

    if (localPart.length > 3) {
      return '${localPart.substring(0, 3)}***$gmail';
    } else {
      /// If the local part is too short, mask as much as possible
      return '${localPart.substring(0, 1)}***$gmail';
    }
  }
}
