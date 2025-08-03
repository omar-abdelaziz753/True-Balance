import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/core/services/di/dependency_injection.dart';
import 'package:truee_balance_app/features/auth/business_logic/auth_cubit.dart';
import 'package:truee_balance_app/features/auth/presentation/screens/create_new_password_screen.dart';
import 'package:truee_balance_app/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:truee_balance_app/features/auth/presentation/screens/login_screen.dart';
import 'package:truee_balance_app/features/auth/presentation/screens/register_screen.dart';
import 'package:truee_balance_app/features/auth/presentation/screens/verify_otp_screen.dart';
import 'package:truee_balance_app/features/choose_your_account/business_logic/cubit/chosse_account_cubit.dart';
import 'package:truee_balance_app/features/choose_your_account/presentation/screens/choose_your_account_screen.dart';
import 'package:truee_balance_app/features/splash/business_logic/splash_cubit.dart';
import 'package:truee_balance_app/features/splash/screens/splash_screen.dart';
import 'package:truee_balance_app/features/therapists/appointments/presentation/screens/appointments_screen.dart';
import 'package:truee_balance_app/features/therapists/appointments_details/presentation/screens/appointments_details_screen.dart';
import 'package:truee_balance_app/features/user/best_therapists/presentation/screens/best_therapists_screen.dart';
import 'package:truee_balance_app/features/user/create%20booking/bloc/cubit/create_booking_cubit.dart';
import 'package:truee_balance_app/features/user/create%20booking/presentation/presentation/booking_screen.dart';
import 'package:truee_balance_app/features/user/doctor%20deatils/presentation/screens/doctor_details_screen.dart';
import 'package:truee_balance_app/features/user/home/presentation/screens/home_screen.dart';
import 'package:truee_balance_app/features/user/home/presentation/screens/our_services.dart';
import 'package:truee_balance_app/features/user/main_layout/business_logic/main_layout_cubit.dart';
import 'package:truee_balance_app/features/user/main_layout/presentation/main_layout.dart';
import 'package:truee_balance_app/features/user/medical_reports/presentation/screens/medical_reports_screen.dart';
import 'package:truee_balance_app/features/user/my_booking/screens/booking_details_screen.dart';
import 'package:truee_balance_app/features/user/my_booking/screens/my_booking_screen.dart';
import 'package:truee_balance_app/features/user/notification/presentation/screens/notification_screen.dart';
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
      case Routes.chooseYourAccountScreen:
        return transition(
          screen: const ChooseYourAccountScreen(),
          cubit: ChosseAccountCubit(),
        );
      case Routes.appointmentsScreen:
        return transition(
          screen: const AppointmentsScreen(),
          // cubit:
        );
      case Routes.appointmentsDetailsScreen:
        return transition(
          screen: const AppointmentsDetailsScreen(),
          // cubit:
        );
      case Routes.bestTherapistsScreen:
        return transition(
          screen: const BestTherapistsScreen(),
          // cubit:
        );

      case Routes.loginScreen:
        return transition(
          screen: const LoginScreen(),
          cubit: AuthCubit(getIt()),
        );
      case Routes.registerScreen:
        return transition(
          screen: const RegisterScreen(),
          cubit: AuthCubit(getIt()),
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
          cubit: AuthCubit(getIt()),
        );
      case Routes.createNewPasswordScreen:
        return transition(
          screen: const CreateNewPasswordScreen(),
        );
      case Routes.mainLayoutScreen:
        return transition(
          screen: const MainLayoutScreen(),
          cubit: MainLayoutCubit(),
        );
      case Routes.doctorDetailsScreen:
        return transition(
          screen: const DoctorDetailsScreen(),
        );
      case Routes.technicalSupportScreen:
        return transition(
          screen: const TechnicalSupportScreen(),
        );
      case Routes.ourServicesScreen:
        return transition(screen: const OurServicesScreen());
      case Routes.myTicketsScreen:
        return transition(screen: const MyTicketsScreen());
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
      case Routes.notificationsScreen:
        return transition(
          screen: const NotificationScreen(),
        );
      case Routes.aboutUsScreen:
        return transition(
          screen: const AboutUsScreen(),
        );
      case Routes.medicalReportsScreen:
        return transition(
          screen: const MedicalReportsScreen(),
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
    const BestTherapistsScreen(),
    BlocProvider(
      create: (context) => CreateBookingCubit(),
      child: const BookingScreen(),
    ),
    // Container(
    //   color: Colors.red,
    // ),
    Container(
      color: Colors.white,
    ),
    const SettingScreen(),
  ];
}
