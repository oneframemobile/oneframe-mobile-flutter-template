import 'package:flutter/material.dart';
import 'package:flutter_provider/core/viewmodel/sms_view_model.dart';
import 'package:flutter_provider/ui/screens/authentication/forgot/forgot_password.dart';
import 'package:flutter_provider/ui/screens/authentication/forgot/renew/email_view.dart';
import 'package:flutter_provider/ui/screens/authentication/forgot/renew/sms_view.dart';
import 'package:flutter_provider/ui/screens/authentication/login/login_view.dart';
import 'package:flutter_provider/ui/screens/authentication/signup/signup_view.dart';
import 'package:flutter_provider/ui/screens/home/home_view.dart';
import 'package:flutter_provider/ui/screens/home/pages/select_city_view.dart';
import 'package:flutter_provider/ui/screens/splash/splash.dart';

import 'ui/screens/authentication/authentication.dart';

class Router {
  static const String splashRoute = '/';
  static const String homeView = '/homeView';
  static const String authentication = '/authentication';
  static const String login = '/login';
  static const String signUp = '/signUp';
  static const String forgotPassword = '/forgotPassword';
  static const String home = '/home';
  static const String selectCity = '/selectCity';
  static const String smsView = '/smsView';
  static const String emailView = '/emailView';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => SplashView());
      case authentication:
        return MaterialPageRoute(builder: (_) => AuthenticationView());
      case login:
        return MaterialPageRoute(builder: (_) => LoginView());
      case signUp:
        return MaterialPageRoute(builder: (_) => SignUpView());
      case forgotPassword:
        return MaterialPageRoute(builder: (_) => ForgotPasswordView());
      case home:
        return MaterialPageRoute(builder: (_) => HomeView());
      case selectCity:
        return MaterialPageRoute(builder: (_) => SelectCityView());
      case smsView:
        return MaterialPageRoute(builder: (_) => SmsView());
      case emailView:
        return MaterialPageRoute(builder: (_) => EmailView());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
