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
import 'package:truee_balance_app/features/doctors/appointments/bloc/cubit/appointments_cubit.dart';
import 'package:truee_balance_app/features/doctors/appointments/presentation/screens/appointments_screen.dart';
import 'package:truee_balance_app/features/doctors/appointments_details/bloc/cubit/appointments_details_cubit.dart';
import 'package:truee_balance_app/features/doctors/appointments_details/presentation/screens/appointments_details_screen.dart';
import 'package:truee_balance_app/features/doctors/main_layout_doctors/business_logic/main_layout_doctors_cubit.dart';
import 'package:truee_balance_app/features/doctors/main_layout_doctors/presentation/main_layout_doctors.dart';
import 'package:truee_balance_app/features/onBoarding/Bloc/on_boarding_cubit.dart';
import 'package:truee_balance_app/features/onBoarding/screens/on_boarding_screen.dart';
import 'package:truee_balance_app/features/splash/business_logic/splash_cubit.dart';
import 'package:truee_balance_app/features/splash/screens/splash_screen.dart';
import 'package:truee_balance_app/features/therapist/details_for_therapists/bloc/details_for_therapists_cubit.dart';
import 'package:truee_balance_app/features/therapist/details_for_therapists/presentation/screens/treatment_plan_for_therapists.dart';
import 'package:truee_balance_app/features/therapist/treatment_details_for_therapists/bloc/cubit/treatment_details_for_therapist_cubit.dart';
import 'package:truee_balance_app/features/therapist/treatment_details_for_therapists/presentation/screen/treatment_details_for_therapists_screen.dart';
import 'package:truee_balance_app/features/user/add%20session/bloc/cubit/add_session_cubit.dart';
import 'package:truee_balance_app/features/user/add%20session/presentation/screens/add_session_screen.dart';
import 'package:truee_balance_app/features/user/best_therapists/cubit/all_doctors_cubit.dart';
import 'package:truee_balance_app/features/user/best_therapists/presentation/screens/best_therapists_screen.dart';
import 'package:truee_balance_app/features/user/create%20booking/bloc/cubit/create_booking_cubit.dart';
import 'package:truee_balance_app/features/user/create%20booking/presentation/screen/booking_screen.dart';
import 'package:truee_balance_app/features/user/doctor%20deatils/bloc/cubit/doctor_details_cubit.dart';
import 'package:truee_balance_app/features/user/doctor%20deatils/data/model/doctor_details_model.dart';
import 'package:truee_balance_app/features/user/doctor%20deatils/presentation/screens/all_revirws.dart';
import 'package:truee_balance_app/features/user/doctor%20deatils/presentation/screens/doctor_details_screen.dart';
import 'package:truee_balance_app/features/user/home/bloc/cubit/home_cubit.dart';
import 'package:truee_balance_app/features/user/home/data/model/doctors/all_doctors_data_model.dart';
import 'package:truee_balance_app/features/user/home/presentation/screens/home_screen.dart';
import 'package:truee_balance_app/features/user/home/presentation/screens/our_services.dart';
import 'package:truee_balance_app/features/user/main_layout/business_logic/main_layout_cubit.dart';
import 'package:truee_balance_app/features/user/main_layout/presentation/main_layout.dart';
import 'package:truee_balance_app/features/user/medical_reports/bloc/cubit/reports_cubit.dart';
import 'package:truee_balance_app/features/user/medical_reports/presentation/screens/medical_reports_screen.dart';
import 'package:truee_balance_app/features/user/my_booking/bloc/mybook_cubit.dart';
import 'package:truee_balance_app/features/user/my_booking/data/models/Consultations/consultations_response.dart';
import 'package:truee_balance_app/features/user/my_booking/presentation/screens/booking_details_screen.dart';
import 'package:truee_balance_app/features/user/my_booking/presentation/screens/my_booking_screen.dart';
import 'package:truee_balance_app/features/user/notification/notification/bloc/cubit/notification_cubit.dart';
import 'package:truee_balance_app/features/user/notification/notification/presentation/screens/notification_screen.dart';
import 'package:truee_balance_app/features/user/session%20details/bloc/cubit/session_details_cubit.dart';
import 'package:truee_balance_app/features/user/session%20details/data/model/treatment_plan_detail.dart';
import 'package:truee_balance_app/features/user/session%20details/presentation/screens/session_details.dart';
import 'package:truee_balance_app/features/user/session%20details/presentation/screens/treatment_details_screen.dart';
import 'package:truee_balance_app/features/user/session%20details/presentation/screens/treatment_plans_screen.dart';
import 'package:truee_balance_app/features/user/sessions/bloc/cubit/sessions_cubit.dart';
import 'package:truee_balance_app/features/user/sessions/presentation/screen/all_therapist_screen.dart';
import 'package:truee_balance_app/features/user/setting/bloc/settings_cubit.dart';
import 'package:truee_balance_app/features/user/setting/presentation/screens/profile_screen.dart';
import 'package:truee_balance_app/features/user/setting/presentation/screens/setting_screen.dart';
import 'package:truee_balance_app/features/user/technical_support/bloc/technical_support_cubit.dart';
import 'package:truee_balance_app/features/user/technical_support/data/models/about_us/about_us_model.dart';
import 'package:truee_balance_app/features/user/technical_support/presentation/screens/about_us_screen.dart';
import 'package:truee_balance_app/features/user/technical_support/presentation/screens/my_tickets_screen.dart';
import 'package:truee_balance_app/features/user/technical_support/presentation/screens/open_a_new_ticket_screen.dart';
import 'package:truee_balance_app/features/user/technical_support/presentation/screens/technical_support_screen.dart';

import '../../features/doctors/appointments/data/model/consultation_users_model.dart'
    show UserData;

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
        final argument = settings.arguments as bool;

        return transition(
          screen: AppointmentsScreen(showLeading: argument),
        );
      case Routes.appointmentsDetailsScreen:
        final arguments = settings.arguments as AppointmentsArguments;
        return transition(
          cubit: AppointmentsDetailsCubit(getIt())
            ..fetchAppointments(
              doctorId: arguments.userData.id!,
              isPending: arguments.isPending,
            ),
          screen: AppointmentsDetailsScreen(
            userData: arguments.userData,
          ),
        );
      case Routes.treatmentDetailsForTherapists:
        final arguments = settings.arguments as TreatmentArguments;

        return transition(
          screen: TreatmentDetailsForTherapists(
            userData: arguments.userData,
            treatmentName: arguments.treatmentName,
          ),
          cubit: TreatmentDetailsForTherapistCubit(getIt())
            ..fetchTreatment(
                doctorId: arguments.treatmentId,
                isPending: arguments.isPending),
        );
      case Routes.bestTherapistsScreen:
        return transition(
          screen: const BestTherapistsScreen(),
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
      case Routes.treatmentPlanForTherapists:
        final user = settings.arguments as AppointmentsArguments;

        return transition(
          screen: TreatmentPlanForTherapists(usersData: user.userData),
          cubit: DetailsForTherapistsCubit(getIt())
            ..getusertreatmentPlansfortherapist(
                id: user.userData.id!, isPending: user.isPending)
            ..setupgetusertreatmentPlansfortherapistScrollController(),
        );
      case Routes.createNewPasswordScreen:
        final Map<String, dynamic> data =
            settings.arguments as Map<String, dynamic>;

        return transition(
          screen: CreateNewPasswordScreen(data: data),
        );
      case Routes.mainLayoutScreen:
        return transition(
          screen: const MainLayoutScreen(),
          cubit: MainLayoutCubit(),
        );
      case Routes.mainLayoutDoctorsScreen:
        return transition(
          screen: const MainLayoutDoctorsScreen(),
          cubit: MainLayoutDoctorsCubit(),
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
            cubit: TechnicalSupportCubit(getIt())..getstaticPages());
      case Routes.ourServicesScreen:
        return transition(
          screen: const OurServicesScreen(),
          cubit: HomeCubit(getIt())
            ..getAllServices()
            ..setupServicesScrollController(),
        );
      case Routes.myTicketsScreen:
        return transition(
          screen: const MyTicketsScreen(),
          cubit: TechnicalSupportCubit(getIt())
            ..getAllTickets()
            ..setupTicketsScrollController(),
        );
      case Routes.openANewTicketScreen:
        return transition(
          screen: const OpenANewTicketScreen(),
          cubit: TechnicalSupportCubit(getIt()),
        );
      case Routes.myBookingScreen:
        return transition(
          screen: const MyBookingScreen(),
          cubit: MybookCubit(getIt())
            ..getAllconsultations(isPending: false)
            ..setupConsultationsScrollController(),
        );
      case Routes.profileScreen:
        return transition(
          screen: const ProfileScreen(),
          cubit: SettingsCubit(getIt())..getProfileData(),
        );
      case Routes.bookingDetailsScreen:
        final consultation = settings.arguments as Consultation;
        return transition(
          screen: BookingDetailsScreen(
            consultation: consultation,
          ),
        );
      case Routes.notificationsScreen:
        return transition(
          cubit: NotificationCubit(getIt())..makeAsRead()..setupNotificationScrollController()..getNotifications(),
          screen: const NotificationScreen(),
        );
      case Routes.aboutUsScreen:
        final data = settings.arguments as AboutUsData;
        return transition(
          screen: AboutUsScreen(
            data: data,
          ),
        );
      case Routes.medicalReportsScreen:
        return transition(
          cubit: ReportsCubit(getIt())..getReports(),
          screen: const MedicalReportsScreen(),
        );
      case Routes.treatmentplansScreen:
        final therapist = settings.arguments as int;
        return transition(
          cubit: SessionDetailsCubit(getIt())
            ..getByTherapist(therapistId: therapist),
          screen: const TreatmentPlansScreen(),
        );
      // case Routes.termsAndConditionsScreen:
      //   return transition(
      //     cubit: TechnicalSupportCubit(getIt())..getTerms(),
      //     screen: const TermsAndConditionsScreen(),
      //   );
      case Routes.treatmentdetailsScreen:
        final argument = settings.arguments as int;
        return transition(
          cubit: SessionDetailsCubit(getIt())
            ..treatmentPlansdetails(therapistId: argument),
          screen: const TreatmentDetailsScreen(),
        );
      case Routes.addSessionScreen:
        final argument = settings.arguments as TreatmentPlanDetail;
        return transition(
          cubit: AddSessionCubit(getIt(), argument),
          screen: const AddSessionScreen(),
        );
      // case Routes.privacyPolicyScreen:
      //   return transition(
      //     cubit: TechnicalSupportCubit(getIt())..getPrivacy(),
      //     screen: const PrivacyPolicyScreen(),
      //   );
      case Routes.allReviews:
        final doctorId = settings.arguments as int;
        return transition(
          cubit: DoctorDetailsCubit(getIt())
            ..getDoctorReviews(doctorId: doctorId)
            ..setupAllDoctorsReviewsScrollController(),
          screen: const AllReviews(),
        );
      case Routes.bookingScreen:
        final argument = settings.arguments as DoctorModelDetails;
        return transition(
          cubit: CreateBookingCubit(getIt())
            ..getAvailableSlots(doctorId: argument.id!),
          screen: BookingScreen(doctorModel: argument),
        );
      case Routes.sessionDetails:
        final argument = settings.arguments as Session;
        return transition(
          screen: SessionDetails(session: argument),
        );

      case Routes.onBoardingScreen:
        return transition(
          cubit: OnBoardingCubit(),
          screen: const OnBoardingScreen(),
        );

      case Routes.completedCousultations:
        final argument = settings.arguments as bool;
        return transition(
          screen: BlocProvider(
            create: (context) => AppointmentsCubit(getIt())
              ..getAllDoctorsConsultations(isPending: false)
              ..setupAllDoctorsConsultationsScrollController(),
            child: AppointmentsScreen(showLeading: argument),
          ),
        );
      case Routes.chatScreen:
        final id = settings.arguments as int;
        return transition(
            screen: ChatScreen(id: id),
            cubit: TechnicalSupportCubit(getIt())
              ..getTicketDetails(ticketId: id));
      default:
        return null;
    }
  }

  List<Widget> screens = [
    BlocProvider(
  create: (context) => NotificationCubit(getIt())..getNotifications(),
  child: BlocProvider(
      create: (context) => HomeCubit(getIt())
        ..getAllDoctors()
        ..getAllServices()
        ..getSliders(),
      child: const HomeScreen(),
    ),
),
    BlocProvider(
      create: (context) => AllDoctorsCubit(getIt())
        ..getAllDoctors()
        ..setupDoctorsScrollController(),
      child: const BestTherapistsScreen(),
    ),
    BlocProvider(
      create: (context) => SessionsCubit(getIt())..getAllTherapist(),
      child: const AllTherapistScreen(),
    ),
    BlocProvider(
      create: (context) => MybookCubit(getIt())
        ..getAllconsultations(isPending: true)
        ..setupConsultationsScrollController(),
      child: const MyBookingScreen(),
    ),
    const SettingScreen(),
  ];

  List<Widget> screensDoctorss = [
    BlocProvider(
      create: (context) => AppointmentsCubit(getIt())
        ..getAllDoctorsConsultations(isPending: true)
        ..setupAllDoctorsConsultationsScrollController(),
      child: const AppointmentsScreen(
        showLeading: false,
      ),
    ),
    const NotificationScreen(),
    const SettingScreen(),
  ];
  List<Widget> screensTherapist = [
    Container(
      color: Colors.white,
    ),
    const NotificationScreen(),
    const SettingScreen(),
  ];
}

class AppointmentsArguments {
  final bool isPending;
  final UserData userData;

  AppointmentsArguments({required this.isPending, required this.userData});
}

class TreatmentArguments {
  final bool isPending;
  final UserData userData;
  final int treatmentId;
  final String treatmentName;
  TreatmentArguments(
      {required this.treatmentId,
      required this.isPending,
      required this.treatmentName,
      required this.userData});
}
