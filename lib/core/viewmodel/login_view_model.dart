import 'package:flutter/widgets.dart';
import 'package:flutter_provider/core/api/bean/request/login_request.dart';
import 'package:flutter_provider/core/api/service.dart';
import 'package:flutter_provider/core/base/base_model.dart';
import 'package:flutter_provider/core/enum/page_named.dart';
import 'package:flutter_provider/core/enum/viewstate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:networking/networking/network_listener.dart';

class LoginViewModel extends BaseModel {
  BuildContext _context;

  BuildContext get context => _context;
  ScrollController scrollController = ScrollController();

  final Service _service = Service();
  String errorMessage;
  bool visibilityField = true;
  bool isKeyboardOpen = false;

  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  LoginRequest loginRequest = new LoginRequest("adminuser@kocsistem.com.tr", "123456");

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

  Future<bool> loginUser(LoginRequest request) async {
    setState(ViewState.Loading);

    if (request.email.isEmpty) {
      errorMessage = 'Email is required.';
      setState(ViewState.Error);
      return false;
    } else if (request.password.isEmpty) {
      errorMessage = 'Password is required.';
      setState(ViewState.Error);
      return false;
    } else {
      await _service.login(
          loginRequest: loginRequest,
          listener: new NetworkListener()
            ..onSuccess((dynamic result) {
              loginSuccess();
            })
            ..onError((dynamic error) {
              errorLogin();
            }));
    }
  }

  loginSuccess() {
   navigator.navigateToRemove(Pages.Home);
  }

  errorLogin() {
    print("accounts/login onerror");
  }

  openForgotPassword(){
    FocusScope.of(context).unfocus();
    navigator.navigateTo(Pages.ForgotPassword);
  }

  openSignUpPage(){
    FocusScope.of(context).unfocus();
    navigator.navigateTo(Pages.SignUp);
  }

  @override
  void setContext(BuildContext context) {
    this._context = context;
  }
}
