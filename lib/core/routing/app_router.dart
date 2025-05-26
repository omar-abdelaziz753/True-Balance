import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/features/auth/presentation/screens/create_new_password_screen.dart';
import 'package:truee_balance_app/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:truee_balance_app/features/auth/presentation/screens/login_screen.dart';
import 'package:truee_balance_app/features/auth/presentation/screens/register_screen.dart';
import 'package:truee_balance_app/features/auth/presentation/screens/verify_otp_screen.dart';
import 'package:truee_balance_app/features/splash/business_logic/splash_cubit.dart';
import 'package:truee_balance_app/features/splash/screens/splash_screen.dart';
import 'package:truee_balance_app/features/user/create%20booking/bloc/cubit/create_booking_cubit.dart';
import 'package:truee_balance_app/features/user/create%20booking/presentation/booking_screen.dart';
import 'package:truee_balance_app/features/user/home/presentation/screens/home_screen.dart';
import 'package:truee_balance_app/features/user/main_layout/business_logic/main_layout_cubit.dart';
import 'package:truee_balance_app/features/user/main_layout/presentation/main_layout.dart';
import 'package:truee_balance_app/features/user/my_booking/screens/booking_details_screen.dart';
import 'package:truee_balance_app/features/user/my_booking/screens/my_booking_screen.dart';
import 'package:truee_balance_app/features/user/setting/presentation/screens/setting_screen.dart';
import 'package:truee_balance_app/features/user/technical_support/presentation/screens/about_us_screen.dart';
import 'package:truee_balance_app/features/user/technical_support/presentation/screens/my_tickets_screen.dart';
import 'package:truee_balance_app/features/user/technical_support/presentation/screens/open_a_new_ticket_screen.dart';
import 'package:truee_balance_app/features/user/technical_support/presentation/screens/privacy_policy_screen.dart';
import 'package:truee_balance_app/features/user/technical_support/presentation/screens/technical_support_screen.dart';
import 'package:truee_balance_app/features/user/technical_support/presentation/screens/terms_and_conditions_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    MaterialPageRoute transition<T extends Cubit<Object>>({
      required Widget screen,
      T? cubit,
      Object? arguments,
    }) {
      final child = cubit != null
          ? BlocProvider<T>(create: (context) => cubit, child: screen)
          : screen;

      return MaterialPageRoute(settings: settings, builder: (context) => child);
    }

    switch (settings.name) {
      case Routes.splashScreen:
        return transition(
          screen: const SplashScreen(),
          cubit: SplashCubit(),
        );
      case Routes.loginScreen:
        return transition(
          screen: const LoginScreen(),
        );
      case Routes.registerScreen:
        return transition(
          screen: const RegisterScreen(),
        );
      case Routes.verifyOtpScreen:
        final Map<String, dynamic> data =
            settings.arguments as Map<String, dynamic>;

        return transition(
          screen: VerifyOtpScreen(data: data),
        );
      case Routes.forgetPasswordScreen:
        return transition(
          screen: const ForgetPasswordScreen(),
        );
      case Routes.createNewPasswordScreen:
        final String email = settings.arguments as String;

        return transition(
          screen: CreateNewPasswordScreen(email: email),
        );
      case Routes.mainLayoutScreen:
        final int index = settings.arguments as int;

        return transition(
          screen: MainLayout(index: index),
          cubit: MainLayoutCubit(),
        );
      case Routes.technicalSupportScreen:
        return transition(
          screen: const TechnicalSupportScreen(),
        );
      case Routes.myTicketsScreen:
        return transition(
          screen: const MyTicketsScreen(),
        );
      case Routes.openANewTicketScreen:
        return transition(
          screen: const OpenANewTicketScreen(),
        );
      case Routes.myBookingScreen:
        return transition(
          screen: const MyBookingScreen(),
        );
      case Routes.bookingDetailsScreen:
        return transition(
          screen: const BookingDetailsScreen(),
        );
      case Routes.aboutUsScreen:
        return transition(
          screen: const AboutUsScreen(),
        );
      case Routes.termsAndConditionsScreen:
        return transition(
          screen: const TermsAndConditionsScreen(),
        );
      case Routes.privacyPolicyScreen:
        return transition(
          screen: const PrivacyPolicyScreen(),
        );
      case Routes.bookingScreen:
        return transition(
          cubit: CreateBookingCubit(),
          screen: const BookingScreen(),
        );
      default:
        return null;
    }
  }

  List<Widget> screens = [
    const HomeScreen(),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.yellow,
    ),
    const SettingScreen(),
  ];
}
