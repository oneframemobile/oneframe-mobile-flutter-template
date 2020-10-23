import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_provider/core/enum/page_named.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  final _removeAllOldRoutes = (Route<dynamic> route) => false;

  Future<dynamic> navigateTo(Pages routeType, [Object arguments = ""]) async {
    return await navigatorKey.currentState.pushNamed(_named(routeType), arguments: arguments);
  }

  pop() {
    if (isPop()) {
      return navigatorKey.currentState.pop();
    }
    return false;
  }

  quitApp() {
    SystemNavigator.pop();
  }

  bool isPop() {
    return navigatorKey.currentState.canPop();
  }

  Future<dynamic> navigateToRemove(Pages routeType, [Object arguments = ""]) async {
    return await navigatorKey.currentState.pushNamedAndRemoveUntil(_named(routeType), _removeAllOldRoutes, arguments: arguments);
  }

  void fullScreenPopup() {
    navigatorKey.currentState.push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new Container();
        },
        fullscreenDialog: true));
  }

  String _named(Pages page) {
    switch (page) {
      case Pages.Splash:
        return "/splash";

      case Pages.Authentication:
        return "/authentication";

      case Pages.Login:
        return "/login";

      case Pages.SignUp:
        return "/signUp";

      case Pages.ForgotPassword:
        return "/forgotPassword";

      case Pages.Home:
        return "/home";

      case Pages.SelectCity:
        return "/selectCity";

      case Pages.SmsView:
        return "/smsView";

      case Pages.EmailView:
        return "/emailView";

      case Pages.SelectTempView:
        return "/selectTempView";

      case Pages.Temp1AuthView:
        return "/temp1AuthView";

      case Pages.Temp1LoginView:
        return "/temp1LoginView";

      case Pages.Temp1ForgotView:
        return "/temp1ForgotView";

      case Pages.Temp1EmailView:
        return "/temp1EmailView";

      case Pages.Temp1SmsView:
        return "/temp1SmsView";

      default:
        return "/";
    }
  }
}
