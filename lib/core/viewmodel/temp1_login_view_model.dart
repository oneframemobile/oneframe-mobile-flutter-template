import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_provider/core/api/bean/request/login_request.dart';
import 'package:flutter_provider/core/api/bean/response/login_response.dart';
import 'package:flutter_provider/core/api/service.dart';
import 'package:flutter_provider/core/base/base_model.dart';
import 'package:flutter_provider/core/enum/page_named.dart';
import 'package:flutter_provider/core/enum/viewstate.dart';
import 'package:networking/networking/network_listener.dart';

class Temp1LoginViewModel extends BaseModel {
  BuildContext _context;

  BuildContext get context => _context;
  LoginRequest loginRequest = new LoginRequest();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>(debugLabel: "_loginFormKey");

  final Service _service = Service();
  String errorMessage;
  LoginResponse loginResponse;
  bool visibiltyField = false;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  void changeVisibility() {
    visibiltyField = !visibiltyField;
    notifyListeners();
  }

  void login(LoginRequest request) {
    // loginResponse = _service.login(request) as LoginResponse;
    notifyListeners();
  }

  loginUser() async {
    setState(ViewState.Loading);

    Future.delayed(Duration(seconds: 1), () async {
      if (!loginFormKey.currentState.validate()) {
        setState(ViewState.Idle);
        notifyListeners();
      } else {
        loginRequest.email = emailController.text;
        loginRequest.password = passwordController.text;
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
    });
  }

  bool isWarningFields() {
    bool isWarning = false;

    if (emailController.text.isEmpty) {
      errorMessage = 'Mail is required.';
      isWarning = true;
    } else if (passwordController.text.isEmpty) {
      errorMessage = 'Password is required.';
      isWarning = true;
    }

    return isWarning;
  }

  loginSuccess() {
    navigator.navigateToRemove(Pages.Temp1Home);
  }

  loginError(dynamic error) {
    try {
      final scaffold = Scaffold.of(context);
      scaffold.showSnackBar(
        SnackBar(
          content: Text(error.data.message),
        ),
      );
    } catch (e) {
      final scaffold = Scaffold.of(context);
      scaffold.showSnackBar(
        SnackBar(
          content: Text("Login on error"),
        ),
      );
    }
  }

  goToForgotView() {
    navigator.navigateTo(Pages.Temp1ForgotView);
  }

  @override
  void setContext(BuildContext context) {
    this._context = context;
  }
}
