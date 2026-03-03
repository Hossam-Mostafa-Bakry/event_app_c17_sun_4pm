import 'package:event_app_c17_sun_4pm/core/routes/pages_route_name.dart';
import 'package:event_app_c17_sun_4pm/modules/add_event/add_event_view.dart';
import 'package:event_app_c17_sun_4pm/modules/forget_password/forget_password_view.dart';
import 'package:event_app_c17_sun_4pm/modules/layout/layout_view.dart';
import 'package:event_app_c17_sun_4pm/modules/on_boarding/on_boarding_view.dart';
import 'package:event_app_c17_sun_4pm/modules/sign_in/sign_in_view.dart';
import 'package:event_app_c17_sun_4pm/modules/sign_up/sign_up_view.dart';
import 'package:event_app_c17_sun_4pm/modules/splash/splash_view.dart';
import 'package:flutter/material.dart';

abstract class AppGenerateRoute {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRouteName.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );

      case PagesRouteName.signIn:
        return MaterialPageRoute(
          builder: (context) => const SignInView(),
          settings: settings,
        );

      case PagesRouteName.signUp:
        return MaterialPageRoute(
          builder: (context) => const SignUpView(),
          settings: settings,
        );

      case PagesRouteName.forgetPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgetPasswordView(),
          settings: settings,
        );

      case PagesRouteName.onBoarding:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingView(),
          settings: settings,
        );

      case PagesRouteName.layout:
        return MaterialPageRoute(
          builder: (context) => const LayoutView(),
          settings: settings,
        );

      case PagesRouteName.addEvent:
        return MaterialPageRoute(
          builder: (context) => const AddEventView(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );
    }
  }
}
