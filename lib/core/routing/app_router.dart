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

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    MaterialPageRoute transition<T extends Cubit<Object>>({
      required Widget screen,
      T? cubit,
      Object? arguments,
    }) {
      final child =
          cubit != null
              ? BlocProvider<T>(create: (context) => cubit, child: screen)
              : screen;

      return MaterialPageRoute(settings: settings, builder: (context) => child);
    }

    switch (settings.name) {
      /// User Screens
      // case Routes.onBoardingScreen:
      //   return transition(
      //     screen: const OnBoardnigScreen(),
      //     // cubit: SplashCubit()..startSplash(),
      //   );
      case Routes.splashScreen:
        return transition(
          screen: const SplashScreen(),
          cubit: SplashCubit(),
        );
      case Routes.loginScreen:
        return transition(
          screen: const LoginScreen(),
          // cubit: SplashCubit(),
        );
      case Routes.registerScreen:
        return transition(
          screen: const RegisterScreen(),
          // cubit: SplashCubit(),
        );
      case Routes.verifyOtpScreen:
        // final String emailAddress = settings.arguments as String;
      final Map<String, dynamic> data = settings.arguments as Map<String, dynamic>;

        return transition(
          screen: VerifyOtpScreen(data: data),
          // cubit: SplashCubit(),
        );
      case Routes.forgetPasswordScreen:
        return transition(
          screen: const ForgetPasswordScreen(),
          // cubit: SplashCubit(),
        );
      case Routes.createNewPasswordScreen:
        final String email = settings.arguments as String;

        return transition(
          screen: CreateNewPasswordScreen(email: email),
          // cubit: SplashCubit(),
        );
      /// ================================================================================= ///

      /// Provider Screens
      default:
        return null;
    }
  }

  // List<Widget> screens = [
  //   BlocProvider(
  //     create:
  //         CacheHelper.getData(key: CacheKeys.userRole) == 'provider'
  //             ? (context) =>
  //                 UserHomeCubit(getIt())
  //                   ..userGetAllOffers()
  //                   ..userGetFeaturedServices()
  //                   ..userGetCategoriesInHome()
  //                   ..getAllCompletedUsersInProvider()
  //             : (context) =>
  //                 UserHomeCubit(getIt())
  //                   ..userGetAllOffers()
  //                   ..userGetFeaturedServices()
  //                   ..userGetCategoriesInHome(),
  //     child: UserHomeScreen(),
  //   ),
  //   BlocProvider(
  //     create:
  //         (context) =>
  //             UserMyOrdersCubit(getIt())
  //               ..userGetAllOrdersPending()
  //               ..userGetAllOrdersAccepted()
  //               ..userGetAllOrdersRejected(),
  //     child: UserMyOrdersScreen(),
  //   ),
  //   BlocProvider(
  //     create:
  //         (context) =>
  //             UserMyReservationsCubit(getIt())..getUserMyReservations(),
  //     child: UserMyReservationsScreen(),
  //   ),
  //   CacheHelper.getData(key: CacheKeys.userRole) == 'provider'
  //       ? BlocProvider(
  //         create:
  //             (context) =>
  //                 CustomerOrdersCubit(getIt())
  //                   ..userGetAllCustomerOrdersPending()
  //                   ..userGetAllCustomerOrdersAccepted()
  //                   ..userGetAllCustomerOrdersRejected(),
  //         child: CustomerOrdersScreen(),
  //       )
  //       : BlocProvider(
  //         create:
  //             (context) =>
  //                 UserCategoriesAndSubCategoriesCubit(getIt())
  //                   ..userGetAllCategories(),
  //         child: UserCategoriesScreen(comesFromHome: false),
  //       ),
  //   BlocProvider(
  //     create: (context) => UserProfileCubit(getIt())..userGetProfileData(),
  //     child: UserProfileScreen(),
  //   ),
  // ];
}
