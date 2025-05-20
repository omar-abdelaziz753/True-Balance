import 'package:easy_localization/easy_localization.dart';

class AppValidator {
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '${fieldName?.tr()} validation.required'.tr();
    }
    return null;
  }

  static String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'validation.address.required'.tr();
    } else {
      return null;
    }
  }

  static String? validateNote(String? value) {
    if (value == null || value.isEmpty) {
      return 'validation.note.required'.tr();
    } else {
      return null;
    }
  }

  static String? validateCity(String? value) {
    if (value == null || value.isEmpty) {
      return 'validation.city.required'.tr();
    } else {
      return null;
    }
  }

  static String? validateBuildingNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'validation.building_number.required'.tr();
    } else {
      return null;
    }
  }
  static String? validateApartmentNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'validation.apartment_number.required'.tr();
    } else {
      return null;
    }
  }

  static String? validateUsername(String? username) {
    if (username == null || username.isEmpty) {
      return 'validation.username.required'.tr();
    }

    if (username.length < 3) {
      return 'validation.username.minLength'.tr();
    }

    // const pattern = r"^[a-zA-Z0-9_-]{3,20}$";
    //
    // final regex = RegExp(pattern);
    //
    // if (!regex.hasMatch(username)) {
    //   return 'validation.username.invalid'.tr();
    // }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'validation.email.required'.tr();
    }

    final emailRegExp = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'validation.email.invalid'.tr();
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'validation.password.required'.tr();
    }

    if (value.length < 6) {
      return 'validation.password.minLength'.tr();
    }

    // if (!value.contains(RegExp(r'[A-Z]'))) {
    //   return 'validation.password.uppercase'.tr();
    // }

    // if (!value.contains(RegExp(r'[0-9]'))) {
    //   return 'validation.password.number'.tr();
    // }

    // if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    //   return 'validation.password.specialChar'.tr();
    // }

    return null;
  }

  static String? validateConfirmPassword(
      String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'validation.confirmPassword.required'.tr();
    }

    if (password != confirmPassword) {
      return 'validation.confirmPassword.mismatch'.tr();
    }

    return null;
  }

  static String? validateSaudiPhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'validation.phone.required'.tr();
    }

    final phoneRegExp = RegExp(r'^[0-9]{9}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'validation.phone.invalid'.tr();
    }

    return null;
  }

  static String? validateOTP(String? value) {
    if (value == null || value.isEmpty) {
      return 'validation.otp.required'.tr();
    }

    if (!RegExp(r'^\d{6}$').hasMatch(value)) {
      return 'validation.otp.invalid'.tr();
    }

    return null;
  }
}