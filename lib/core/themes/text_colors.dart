import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Styles {
  static TextStyle getLocalizedTextStyle({
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
    double? letterSpacing,
  }) {
    // Use IBM Plex Sans Arabic for both languages
    return TextStyle(
      fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
    );
  }

  /// ==========================HEADING================================ ///
  /// ================================================================= ///
  static TextStyle heading3 = getLocalizedTextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static TextStyle heading4 = getLocalizedTextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static TextStyle heroBold = getLocalizedTextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static TextStyle heroAccent = getLocalizedTextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );
  static TextStyle heroEmphasis = getLocalizedTextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
  static TextStyle heroStandard = getLocalizedTextStyle(
    fontSize: 28,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  /// ================================================================= ///

  /// ==========================BODY TEXT=============================== ///
  /// ================================================================= ///
  static TextStyle featureBold = getLocalizedTextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static TextStyle featureAccent = getLocalizedTextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static TextStyle featureEmphasis = getLocalizedTextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
  static TextStyle featureStandard = getLocalizedTextStyle(
    fontSize: 24,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );
  static TextStyle highlightBold = getLocalizedTextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static TextStyle highlightAccent = getLocalizedTextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static TextStyle highlightEmphasis = getLocalizedTextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
  static TextStyle highlightStandard = getLocalizedTextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );
  static TextStyle contentBold = getLocalizedTextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static TextStyle contentAccent = getLocalizedTextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static TextStyle contentEmphasis = getLocalizedTextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
  static TextStyle contentRegular = getLocalizedTextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );
  static TextStyle captionBold = getLocalizedTextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static TextStyle captionAccent = getLocalizedTextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static TextStyle captionEmphasis = getLocalizedTextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
  static TextStyle captionRegular = getLocalizedTextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );
  static TextStyle footnoteBold = getLocalizedTextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static TextStyle footnoteSemiboldBold = getLocalizedTextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static TextStyle footnoteEmphasis = getLocalizedTextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
  static TextStyle footnoteRegular = getLocalizedTextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );
}
