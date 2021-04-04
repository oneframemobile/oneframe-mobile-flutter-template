import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_provider/core/api/bean/request/login_request.dart';
import 'package:flutter_provider/core/api/service.dart';
import 'package:flutter_provider/core/base/base_model.dart';
import 'package:flutter_provider/core/enum/page_named.dart';
import 'package:flutter_provider/core/enum/viewstate.dart';
import 'package:flutter_provider/shared/warning.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:networking/networking/network_listener.dart';

class LoginViewModel extends BaseModel {
  BuildContext _context;

  BuildContext get context => _context;
  ScrollController scrollController = ScrollController();

  final loginKey = GlobalKey<ScaffoldState>(debugLabel: "_loginKey");

  final Service _service = Service();
  String errorMessage;
  bool visibilityField = true;
  bool isKeyboardOpen = false;

  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  LoginRequest loginRequest = new LoginRequest();

  var email = TextEditingController();
  var password = TextEditingController();

  LoginViewModel() {
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        isKeyboardOpen = visible;
        notifyListeners();
      },
    );
  }

  void changeVisibility() {
    visibilityField = !visibilityField;
    notifyListeners();
  }

  loginUser() async {
    setState(ViewState.Loading);
    loginSuccess();
    /*Future.delayed(Duration(seconds: 1), () async {
      if (isWarningFields()) {
        WarningDialog.showSnackBar(key: loginKey, child: Text(errorMessage));
        setState(ViewState.Idle);
      } else {
        loginRequest.email = email.text;
        loginRequest.password = password.text;
        await _service.login(
            loginRequest: loginRequest,
            listener: new NetworkListener()
              ..onSuccess((dynamic result) {
                setState(ViewState.Idle);
                loginSuccess();
              })
              ..onError((dynamic error) {
                setState(ViewState.Idle);
                loginError(error);
              }));
      }
    });*/
  }

  loginSuccess() {
    navigator.navigateToRemove(Pages.Home);
  }

  loginError(dynamic error) {
    try {
      WarningDialog.showSnackBar(key: loginKey, child: Text(error.data.message));
    } catch (e) {
      WarningDialog.showSnackBar(key: loginKey, child: Text("Login on error"));
    }
  }


  openForgotPassword() {
    FocusScope.of(context).unfocus();
    navigator.navigateTo(Pages.ForgotPassword);
  }

  openSignUpPage() {
    FocusScope.of(context).unfocus();
    navigator.navigateTo(Pages.SignUp);
  }

  bool isWarningFields() {
    bool isWarning = false;

    if (email.text.isEmpty) {
      errorMessage = 'Lütfen mail adresinizi girin.';
      isWarning = true;
    } else if (password.text.isEmpty) {
      errorMessage = 'Lütfen şifrenizi girin.';
      isWarning = true;
    }

    return isWarning;
  }

  @override
  void setContext(BuildContext context) {
    this._context = context;
  }
}
