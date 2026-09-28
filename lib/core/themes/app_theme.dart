import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_balance_app/core/themes/app_colors.dart';

class AppTheme {
  static final Color _primaryColor = AppColors.primaryColor10;
  static final Color _secondaryColor = AppColors.secondaryColor10;
  static final Color _errorColor = AppColors.redColor10;

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: _primaryColor,
      scaffoldBackgroundColor: AppColors.neutralColor100,
      colorScheme: _lightColorScheme,
      appBarTheme: _lightAppBarTheme,
      cardTheme: _cardTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      outlinedButtonTheme: _outlinedButtonTheme,
      textButtonTheme: _textButtonTheme,
      floatingActionButtonTheme: _fabTheme,
      inputDecorationTheme: _inputDecorationTheme,
      bottomNavigationBarTheme: _bottomNavTheme,
      navigationBarTheme: _navigationBarTheme,
      chipTheme: _chipTheme,
      dividerTheme: _dividerTheme,
      iconTheme: _iconTheme,
      textTheme: _textTheme,
      checkboxTheme: _checkboxTheme,
      switchTheme: _switchTheme,
      radioTheme: _radioTheme,
      progressIndicatorTheme: _progressIndicatorTheme,
      snackBarTheme: _snackBarTheme,
      dialogTheme: _dialogThemeData,
      bottomSheetTheme: _bottomSheetTheme,
      tabBarTheme: _tabBarThemeData,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: _primaryColor,
      scaffoldBackgroundColor: AppColors.neutralColor900,
      colorScheme: _darkColorScheme,
      appBarTheme: _darkAppBarTheme,
      cardTheme: _cardThemeDark,
      elevatedButtonTheme: _elevatedButtonTheme,
      outlinedButtonTheme: _outlinedButtonTheme,
      textButtonTheme: _textButtonTheme,
      floatingActionButtonTheme: _fabTheme,
      inputDecorationTheme: _inputDecorationThemeDark,
      bottomNavigationBarTheme: _bottomNavThemeDark,
      navigationBarTheme: _navigationBarThemeDark,
      chipTheme: _chipTheme,
      dividerTheme: _dividerTheme,
      iconTheme: _iconTheme,
      textTheme: _textThemeDark,
      checkboxTheme: _checkboxTheme,
      switchTheme: _switchTheme,
      radioTheme: _radioTheme,
      progressIndicatorTheme: _progressIndicatorTheme,
      snackBarTheme: _snackBarTheme,
      dialogTheme: _dialogThemeData,
      bottomSheetTheme: _bottomSheetTheme,
      tabBarTheme: _tabBarThemeDark,
    );
  }

  static ColorScheme get _lightColorScheme => ColorScheme.light(
        primary: _primaryColor,
        onPrimary: Colors.white,
        primaryContainer: AppColors.primaryColor100,
        onPrimaryContainer: AppColors.primaryColor1000,
        secondary: _secondaryColor,
        onSecondary: Colors.white,
        secondaryContainer: AppColors.secondaryColor100,
        onSecondaryContainer: AppColors.secondaryColor900,
        tertiary: AppColors.greenColor100,
        onTertiary: AppColors.greenColor200,
        tertiaryContainer: AppColors.greenColor100,
        onTertiaryContainer: AppColors.greenColor200,
        error: _errorColor,
        onError: Colors.white,
        errorContainer: AppColors.redColor100,
        onErrorContainer: AppColors.redColor200,
        surface: AppColors.neutralColor100,
        onSurface: AppColors.neutralColor900,
        surfaceContainerHighest: AppColors.neutralColor200,
        onSurfaceVariant: AppColors.neutralColor600,
        outline: AppColors.neutralColor400,
        outlineVariant: AppColors.neutralColor300,
        shadow: Colors.black,
        scrim: Colors.black,
        inverseSurface: AppColors.neutralColor800,
        onInverseSurface: AppColors.neutralColor100,
        inversePrimary: AppColors.primaryColor300,
      );

  static ColorScheme get _darkColorScheme => ColorScheme.dark(
        primary: AppColors.primaryColor300,
        onPrimary: AppColors.primaryColor1000,
        primaryContainer: AppColors.primaryColor900,
        onPrimaryContainer: AppColors.primaryColor100,
        secondary: AppColors.secondaryColor300,
        onSecondary: AppColors.secondaryColor1000,
        secondaryContainer: AppColors.secondaryColor900,
        onSecondaryContainer: AppColors.secondaryColor100,
        tertiary: AppColors.greenColor100,
        onTertiary: AppColors.greenColor200,
        tertiaryContainer: AppColors.greenColor200,
        onTertiaryContainer: AppColors.greenColor100,
        error: AppColors.redColor100,
        onError: AppColors.neutralColor900,
        errorContainer: AppColors.redColor200,
        onErrorContainer: AppColors.redColor100,
        surface: AppColors.neutralColor900,
        onSurface: AppColors.neutralColor100,
        surfaceContainerHighest: AppColors.neutralColor800,
        onSurfaceVariant: AppColors.neutralColor300,
        outline: AppColors.neutralColor500,
        outlineVariant: AppColors.neutralColor700,
        shadow: Colors.black,
        scrim: Colors.black,
        inverseSurface: AppColors.neutralColor100,
        onInverseSurface: AppColors.neutralColor900,
        inversePrimary: _primaryColor,
      );

  static AppBarTheme get _lightAppBarTheme {
    return AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 2,
      backgroundColor: AppColors.neutralColor100,
      foregroundColor: AppColors.neutralColor900,
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      centerTitle: true,
      titleTextStyle: GoogleFonts.ibmPlexSansArabic(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.neutralColor900,
      ),
      iconTheme: IconThemeData(
        color: AppColors.neutralColor900,
        size: 24,
      ),
    );
  }

  static AppBarTheme get _darkAppBarTheme {
    return AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 2,
      backgroundColor: AppColors.neutralColor900,
      foregroundColor: AppColors.neutralColor100,
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      centerTitle: true,
      titleTextStyle: GoogleFonts.ibmPlexSansArabic(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.neutralColor100,
      ),
      iconTheme: IconThemeData(
        color: AppColors.neutralColor100,
        size: 24,
      ),
    );
  }

  static CardThemeData get _cardTheme {
    return CardThemeData(
      elevation: 2,
      shadowColor: Colors.black.withValues(alpha: 0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: AppColors.neutralColor100,
      surfaceTintColor: _primaryColor,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }

  static CardThemeData get _cardThemeDark {
    return CardThemeData(
      elevation: 2,
      shadowColor: Colors.black.withValues(alpha: 0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: AppColors.neutralColor800,
      surfaceTintColor: _primaryColor,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }

  static ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _primaryColor,
        foregroundColor: Colors.white,
        elevation: 2,
        shadowColor: _primaryColor.withValues(alpha: 0.4),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: GoogleFonts.ibmPlexSansArabic(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        minimumSize: const Size(120, 48),
      ),
    );
  }

  static OutlinedButtonThemeData get _outlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: _primaryColor,
        side: BorderSide(color: _primaryColor, width: 1.5),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: GoogleFonts.ibmPlexSansArabic(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        minimumSize: const Size(120, 48),
      ),
    );
  }

  static TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: _primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: GoogleFonts.ibmPlexSansArabic(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  static FloatingActionButtonThemeData get _fabTheme {
    return FloatingActionButtonThemeData(
      backgroundColor: _primaryColor,
      foregroundColor: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  static InputDecorationTheme get _inputDecorationTheme {
    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.neutralColor200.withValues(alpha: 0.5),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.neutralColor300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: _primaryColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: _errorColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: _errorColor, width: 2),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.neutralColor200),
      ),
      hintStyle: GoogleFonts.ibmPlexSansArabic(
        fontSize: 14,
        color: AppColors.neutralColor400,
      ),
      labelStyle: GoogleFonts.ibmPlexSansArabic(
        fontSize: 14,
        color: AppColors.neutralColor600,
      ),
      errorStyle: GoogleFonts.ibmPlexSansArabic(
        fontSize: 12,
        color: _errorColor,
      ),
      prefixIconColor: AppColors.neutralColor500,
      suffixIconColor: AppColors.neutralColor500,
    );
  }

  static InputDecorationTheme get _inputDecorationThemeDark {
    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.neutralColor800,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.neutralColor600),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: _primaryColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: _errorColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: _errorColor, width: 2),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.neutralColor700),
      ),
      hintStyle: GoogleFonts.ibmPlexSansArabic(
        fontSize: 14,
        color: AppColors.neutralColor400,
      ),
      labelStyle: GoogleFonts.ibmPlexSansArabic(
        fontSize: 14,
        color: AppColors.neutralColor300,
      ),
      errorStyle: GoogleFonts.ibmPlexSansArabic(
        fontSize: 12,
        color: _errorColor,
      ),
      prefixIconColor: AppColors.neutralColor400,
      suffixIconColor: AppColors.neutralColor400,
    );
  }

  static BottomNavigationBarThemeData get _bottomNavTheme {
    return BottomNavigationBarThemeData(
      backgroundColor: AppColors.neutralColor100,
      selectedItemColor: _primaryColor,
      unselectedItemColor: AppColors.neutralColor400,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
      selectedLabelStyle: GoogleFonts.ibmPlexSansArabic(
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: GoogleFonts.ibmPlexSansArabic(
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  static BottomNavigationBarThemeData get _bottomNavThemeDark {
    return BottomNavigationBarThemeData(
      backgroundColor: AppColors.neutralColor900,
      selectedItemColor: _primaryColor,
      unselectedItemColor: AppColors.neutralColor500,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
      selectedLabelStyle: GoogleFonts.ibmPlexSansArabic(
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: GoogleFonts.ibmPlexSansArabic(
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  static NavigationBarThemeData get _navigationBarTheme {
    return NavigationBarThemeData(
      backgroundColor: AppColors.neutralColor100,
      indicatorColor: _primaryColor.withValues(alpha: 0.2),
      surfaceTintColor: Colors.transparent,
      elevation: 3,
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return GoogleFonts.ibmPlexSansArabic(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: _primaryColor,
          );
        }
        return GoogleFonts.ibmPlexSansArabic(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: AppColors.neutralColor500,
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return IconThemeData(color: _primaryColor, size: 24);
        }
        return IconThemeData(color: AppColors.neutralColor500, size: 24);
      }),
    );
  }

  static NavigationBarThemeData get _navigationBarThemeDark {
    return NavigationBarThemeData(
      backgroundColor: AppColors.neutralColor900,
      indicatorColor: _primaryColor.withValues(alpha: 0.2),
      surfaceTintColor: Colors.transparent,
      elevation: 3,
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return GoogleFonts.ibmPlexSansArabic(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: _primaryColor,
          );
        }
        return GoogleFonts.ibmPlexSansArabic(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: AppColors.neutralColor400,
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return IconThemeData(color: _primaryColor, size: 24);
        }
        return IconThemeData(color: AppColors.neutralColor400, size: 24);
      }),
    );
  }

  static ChipThemeData get _chipTheme {
    return ChipThemeData(
      backgroundColor: AppColors.neutralColor200,
      selectedColor: _primaryColor.withValues(alpha: 0.2),
      labelStyle: GoogleFonts.ibmPlexSansArabic(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  static DividerThemeData get _dividerTheme {
    return DividerThemeData(
      color: AppColors.neutralColor200,
      thickness: 1,
      space: 1,
    );
  }

  static IconThemeData get _iconTheme {
    return IconThemeData(
      color: AppColors.neutralColor600,
      size: 24,
    );
  }

  static TextTheme get _textTheme {
    return TextTheme(
      displayLarge: GoogleFonts.ibmPlexSansArabic(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        color: AppColors.neutralColor900,
      ),
      displayMedium: GoogleFonts.ibmPlexSansArabic(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        color: AppColors.neutralColor900,
      ),
      displaySmall: GoogleFonts.ibmPlexSansArabic(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        color: AppColors.neutralColor900,
      ),
      headlineLarge: GoogleFonts.ibmPlexSansArabic(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: AppColors.neutralColor900,
      ),
      headlineMedium: GoogleFonts.ibmPlexSansArabic(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: AppColors.neutralColor900,
      ),
      headlineSmall: GoogleFonts.ibmPlexSansArabic(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.neutralColor900,
      ),
      titleLarge: GoogleFonts.ibmPlexSansArabic(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: AppColors.neutralColor900,
      ),
      titleMedium: GoogleFonts.ibmPlexSansArabic(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.neutralColor900,
      ),
      titleSmall: GoogleFonts.ibmPlexSansArabic(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.neutralColor900,
      ),
      bodyLarge: GoogleFonts.ibmPlexSansArabic(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.neutralColor900,
      ),
      bodyMedium: GoogleFonts.ibmPlexSansArabic(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.neutralColor900,
      ),
      bodySmall: GoogleFonts.ibmPlexSansArabic(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.neutralColor600,
      ),
      labelLarge: GoogleFonts.ibmPlexSansArabic(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.neutralColor900,
      ),
      labelMedium: GoogleFonts.ibmPlexSansArabic(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.neutralColor900,
      ),
      labelSmall: GoogleFonts.ibmPlexSansArabic(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: AppColors.neutralColor600,
      ),
    );
  }

  static TextTheme get _textThemeDark {
    return TextTheme(
      displayLarge: GoogleFonts.ibmPlexSansArabic(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        color: AppColors.neutralColor100,
      ),
      displayMedium: GoogleFonts.ibmPlexSansArabic(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        color: AppColors.neutralColor100,
      ),
      displaySmall: GoogleFonts.ibmPlexSansArabic(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        color: AppColors.neutralColor100,
      ),
      headlineLarge: GoogleFonts.ibmPlexSansArabic(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: AppColors.neutralColor100,
      ),
      headlineMedium: GoogleFonts.ibmPlexSansArabic(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: AppColors.neutralColor100,
      ),
      headlineSmall: GoogleFonts.ibmPlexSansArabic(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.neutralColor100,
      ),
      titleLarge: GoogleFonts.ibmPlexSansArabic(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: AppColors.neutralColor100,
      ),
      titleMedium: GoogleFonts.ibmPlexSansArabic(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.neutralColor100,
      ),
      titleSmall: GoogleFonts.ibmPlexSansArabic(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.neutralColor100,
      ),
      bodyLarge: GoogleFonts.ibmPlexSansArabic(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.neutralColor100,
      ),
      bodyMedium: GoogleFonts.ibmPlexSansArabic(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.neutralColor100,
      ),
      bodySmall: GoogleFonts.ibmPlexSansArabic(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.neutralColor400,
      ),
      labelLarge: GoogleFonts.ibmPlexSansArabic(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.neutralColor100,
      ),
      labelMedium: GoogleFonts.ibmPlexSansArabic(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.neutralColor100,
      ),
      labelSmall: GoogleFonts.ibmPlexSansArabic(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: AppColors.neutralColor400,
      ),
    );
  }

  static CheckboxThemeData get _checkboxTheme {
    return CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return _primaryColor;
        }
        return Colors.transparent;
      }),
      checkColor: WidgetStateProperty.all(Colors.white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      side: BorderSide(color: AppColors.neutralColor400, width: 2),
    );
  }

  static SwitchThemeData get _switchTheme {
    return SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return _primaryColor;
        }
        return AppColors.neutralColor400;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return _primaryColor.withValues(alpha: 0.5);
        }
        return AppColors.neutralColor300;
      }),
    );
  }

  static RadioThemeData get _radioTheme {
    return RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return _primaryColor;
        }
        return AppColors.neutralColor400;
      }),
    );
  }

  static ProgressIndicatorThemeData get _progressIndicatorTheme {
    return ProgressIndicatorThemeData(
      color: _primaryColor,
      linearTrackColor: AppColors.neutralColor200,
      circularTrackColor: AppColors.neutralColor200,
    );
  }

  static SnackBarThemeData get _snackBarTheme {
    return SnackBarThemeData(
      backgroundColor: AppColors.neutralColor800,
      contentTextStyle: GoogleFonts.ibmPlexSansArabic(
        fontSize: 14,
        color: AppColors.neutralColor100,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      behavior: SnackBarBehavior.floating,
    );
  }

  static DialogThemeData get _dialogThemeData {
    return DialogThemeData(
      backgroundColor: AppColors.neutralColor100,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      titleTextStyle: GoogleFonts.ibmPlexSansArabic(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.neutralColor900,
      ),
      contentTextStyle: GoogleFonts.ibmPlexSansArabic(
        fontSize: 14,
        color: AppColors.neutralColor700,
      ),
    );
  }

  static BottomSheetThemeData get _bottomSheetTheme {
    return BottomSheetThemeData(
      backgroundColor: AppColors.neutralColor100,
      surfaceTintColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      dragHandleColor: AppColors.neutralColor300,
      dragHandleSize: const Size(40, 4),
      showDragHandle: true,
    );
  }

  static TabBarThemeData get _tabBarThemeData {
    return TabBarThemeData(
      labelColor: _primaryColor,
      unselectedLabelColor: AppColors.neutralColor400,
      labelStyle: GoogleFonts.ibmPlexSansArabic(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: GoogleFonts.ibmPlexSansArabic(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: _primaryColor, width: 3),
      ),
      indicatorSize: TabBarIndicatorSize.label,
    );
  }

  static TabBarThemeData get _tabBarThemeDark {
    return TabBarThemeData(
      labelColor: _primaryColor,
      unselectedLabelColor: AppColors.neutralColor400,
      labelStyle: GoogleFonts.ibmPlexSansArabic(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: GoogleFonts.ibmPlexSansArabic(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: _primaryColor, width: 3),
      ),
      indicatorSize: TabBarIndicatorSize.label,
    );
  }
}
