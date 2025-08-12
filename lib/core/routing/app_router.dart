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
import 'package:truee_balance_app/features/chat/presentation/screens/chat_screen.dart';
import 'package:truee_balance_app/features/choose_your_account/business_logic/cubit/chosse_account_cubit.dart';
import 'package:truee_balance_app/features/choose_your_account/presentation/screens/choose_your_account_screen.dart';
import 'package:truee_balance_app/features/onBoarding/Bloc/on_boarding_cubit.dart';
import 'package:truee_balance_app/features/onBoarding/screens/on_boarding_screen.dart';
import 'package:truee_balance_app/features/splash/business_logic/splash_cubit.dart';
import 'package:truee_balance_app/features/splash/screens/splash_screen.dart';
import 'package:truee_balance_app/features/therapists/appointments/presentation/screens/appointments_screen.dart';
import 'package:truee_balance_app/features/therapists/appointments_details/presentation/screens/appointments_details_screen.dart';
import 'package:truee_balance_app/features/therapists/main_layout_therapists/business_logic/main_layout_therapists_cubit.dart';
import 'package:truee_balance_app/features/therapists/main_layout_therapists/presentation/main_layout_therapists.dart';
import 'package:truee_balance_app/features/user/best_therapists/cubit/all_doctors_cubit.dart';
import 'package:truee_balance_app/features/user/best_therapists/presentation/screens/best_therapists_screen.dart';
import 'package:truee_balance_app/features/user/create%20booking/bloc/cubit/create_booking_cubit.dart';
import 'package:truee_balance_app/features/user/create%20booking/presentation/screen/booking_screen.dart';
import 'package:truee_balance_app/features/user/doctor%20deatils/bloc/cubit/doctor_details_cubit.dart';
import 'package:truee_balance_app/features/user/doctor%20deatils/data/model/doctor_details_model.dart';
import 'package:truee_balance_app/features/user/doctor%20deatils/presentation/screens/doctor_details_screen.dart';
import 'package:truee_balance_app/features/user/home/bloc/cubit/home_cubit.dart';
import 'package:truee_balance_app/features/user/home/data/model/doctors/all_doctors_data_model.dart';
import 'package:truee_balance_app/features/user/home/presentation/screens/home_screen.dart';
import 'package:truee_balance_app/features/user/home/presentation/screens/our_services.dart';
import 'package:truee_balance_app/features/user/main_layout/business_logic/main_layout_cubit.dart';
import 'package:truee_balance_app/features/user/main_layout/presentation/main_layout.dart';
import 'package:truee_balance_app/features/user/medical_reports/presentation/screens/medical_reports_screen.dart';
import 'package:truee_balance_app/features/user/my_booking/screens/booking_details_screen.dart';
import 'package:truee_balance_app/features/user/my_booking/screens/my_booking_screen.dart';
import 'package:truee_balance_app/features/user/notification/presentation/screens/notification_screen.dart';
// <<<<<<< Services
import 'package:truee_balance_app/features/user/sessions/bloc/cubit/sessions_cubit.dart';
import 'package:truee_balance_app/features/user/sessions/presentation/screen/all_therapist_screen.dart';
import 'package:truee_balance_app/features/user/sessions/presentation/screen/treatment_details_screen.dart';
import 'package:truee_balance_app/features/user/sessions/presentation/screen/treatment_plans_screen.dart';
import 'package:truee_balance_app/features/user/setting/bloc/settings_cubit.dart';
// =======
import 'package:truee_balance_app/features/user/setting/presentation/screens/profile_screen.dart';
// >>>>>>> main
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
      case Routes.mainLayoutTherapistsScreen:
        return transition(
          screen: const MainLayoutTherapistsScreen(),
          cubit: MainLayoutTherapistsCubit(),
        );
      case Routes.doctorDetailsScreen:
        final DoctorModel doctorModel = settings.arguments as DoctorModel;

        return transition(
          cubit: DoctorDetailsCubit(getIt())
            ..fetchDoctorDetails(doctorId: doctorModel.id),
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
      case Routes.profileScreen:
        return transition(
          screen: const ProfileScreen(),
          cubit: SettingsCubit(getIt())..getProfileData(),
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
      case Routes.treatmentplansScreen:
        final therapist = settings.arguments as int;
        return transition(
          cubit: SessionsCubit(getIt())..getByTherapist(therapistId: therapist),
          screen: const TreatmentPlansScreen(),
        );
      case Routes.termsAndConditionsScreen:
        return transition(
          screen: const TermsAndConditionsScreen(),
        );
      case Routes.treatmentdetailsScreen:
        return transition(
          screen: const TreatmentDetailsScreen(),
        );
      case Routes.privacyPolicyScreen:
        return transition(
          screen: const PrivacyPolicyScreen(),
        );
      case Routes.bookingScreen:
        final argument = settings.arguments as DoctorModelDetails;
        return transition(
          cubit: CreateBookingCubit(getIt())
            ..getAvailableSlots(doctorId: argument.id),
          screen: BookingScreen(doctorModel: argument),
        );
      case Routes.allTherapistsScreen:
        return transition(
          cubit: SessionsCubit(getIt())..getAllTherapist(),
          screen: const AllTherapistScreen(),
        );
      case Routes.onBoardingScreen:
        return transition(
          cubit: OnBoardingCubit(),
          screen: const OnBoardingScreen(),
        );
      case Routes.chatScreen:
        return transition(
          // cubit:,
          screen: const ChatScreen(),
        );
      default:
        return null;
    }
  }

  List<Widget> screens = [
    BlocProvider(
      create: (context) => HomeCubit(getIt())
        ..getAllDoctors()
        ..getAllServices()
        ..getSliders(),
      child: const HomeScreen(),
    ),
    BlocProvider(
      create: (context) => AllDoctorsCubit(getIt())..getAllDoctors(),
      child: const BestTherapistsScreen(),
    ),
    BlocProvider(
      create: (context) => SessionsCubit(getIt())..getAllTherapist(),
      child: const AllTherapistScreen(),
    ),
    // Container(
    //   color: Colors.white,
    // ),
    Container(
      color: Colors.white,
    ),
    const SettingScreen(),
  ];

  List<Widget> screensTherapists = [
    const AppointmentsScreen(),
    const NotificationScreen(),
    Container()
  ];
}
