import 'package:flutter/material.dart';
import 'package:flutter_provider/select_temp_view.dart';
import 'package:flutter_provider/temp1/views/authentication/forgot/renew/temp1_email_view.dart';
import 'package:flutter_provider/temp1/views/authentication/forgot/renew/temp1_sms_view.dart';
import 'package:flutter_provider/temp1/views/authentication/forgot/temp1_forgot_view.dart';
import 'package:flutter_provider/temp1/views/authentication/login/temp1_login_view.dart';
import 'package:flutter_provider/temp1/views/authentication/temp1_auth_view.dart';
import 'package:flutter_provider/temp2/views/authentication/authentication.dart';
import 'package:flutter_provider/temp2/views/authentication/forgot/forgot_password.dart';
import 'package:flutter_provider/temp2/views/authentication/forgot/renew/email_view.dart';
import 'package:flutter_provider/temp2/views/authentication/forgot/renew/sms_view.dart';
import 'package:flutter_provider/temp2/views/authentication/login/login_view.dart';
import 'package:flutter_provider/temp2/views/authentication/register/register_view.dart';
import 'package:flutter_provider/temp2/views/home/home_view.dart';
import 'package:flutter_provider/temp2/views/home/pages/select_city_view.dart';
import 'package:flutter_provider/temp2/views/splash/splash_view.dart';

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
  static const String selectTempView = '/selectTempView';
  static const String temp1AuthView = '/temp1AuthView';
  static const String temp1LoginView = '/temp1LoginView';
  static const String temp1ForgotView = '/temp1ForgotView';
  static const String temp1EmailView = '/temp1EmailView';
  static const String temp1SmsView = '/temp1SmsView';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => SplashView());
      case authentication:
        return MaterialPageRoute(builder: (_) => AuthenticationView());
      case login:
        return MaterialPageRoute(builder: (_) => LoginView());
      case signUp:
        return MaterialPageRoute(builder: (_) => RegisterView());
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
      case selectTempView:
        return MaterialPageRoute(builder: (_) => SelectTempView());
      case temp1AuthView:
        return MaterialPageRoute(builder: (_) => Temp1AuthView());
      case temp1LoginView:
        return MaterialPageRoute(builder: (_) => Temp1LoginView());
      case temp1ForgotView:
        return MaterialPageRoute(builder: (_) => Temp1ForgotView());
      case temp1EmailView:
        return MaterialPageRoute(builder: (_) => Temp1EmailView());
      case temp1SmsView:
        return MaterialPageRoute(builder: (_) => Temp1SmsView());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
