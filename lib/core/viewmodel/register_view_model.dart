import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_provider/core/api/bean/request/register_request.dart';
import 'package:flutter_provider/core/api/bean/response/login_response.dart';
import 'package:flutter_provider/core/api/service.dart';
import 'package:flutter_provider/core/base/base_model.dart';
import 'package:flutter_provider/core/enum/viewstate.dart';
import 'package:flutter_provider/shared/warning.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:networking/networking.dart';

class RegisterViewModel extends BaseModel {
  BuildContext _context;

  BuildContext get context => _context;
  String errorMessage;
  LoginResponse registerResponse;
  String warningMessage;
  MaskTextInputFormatter formatter;
  RegisterRequest registerRequest = new RegisterRequest();
  final Service _service = Service();

  final registerKey = GlobalKey<ScaffoldState>(debugLabel: "_registerKey");

  final FocusNode nameFocus = FocusNode();
  final FocusNode surnameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode phoneFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  var nameController = TextEditingController();
  var surnameController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var mailController = TextEditingController();

  bool visibilityField = true;
  bool isKeyboardOpen = false;

  RegisterViewModel() {
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        isKeyboardOpen = visible;
        notifyListeners();
      },
    );

    formatter = new MaskTextInputFormatter(mask: '(###) ### ## ##', filter: {"#": RegExp(r'[0-9]')});
  }

  void changeVisibility() {
    visibilityField = !visibilityField;
    notifyListeners();
  }

  void registerUser() async {
    setState(ViewState.Loading);

    if (isWarningFields()) {
      WarningDialog.showSnackBar(key: registerKey, child: Text(errorMessage ?? ""));
      setState(ViewState.Idle);
    } else {
      Future.delayed(Duration(seconds: 1), () async {
        registerRequest.name = nameController.text;
        registerRequest.surname = surnameController.text;
        registerRequest.email = mailController.text;
        registerRequest.phoneNumber = "0${formatter.getUnmaskedText()}";
        registerRequest.password = passwordController.text;
        await _service.register(
            registerRequest: registerRequest,
            listener: new NetworkListener()
              ..onSuccess((dynamic result) {
                setState(ViewState.Idle);
                navigator.pop();
              })
              ..onError((dynamic error) {
                setState(ViewState.Idle);
                print("accounts/register onerror");
              }));
      });
    }
  }

  bool isWarningFields() {
    bool isWarning = false;

    if (nameController.text.isEmpty) {
      errorMessage = 'Name is required.';
      isWarning = true;
    } else if (surnameController.text.isEmpty) {
      errorMessage = 'Surname is required.';
      isWarning = true;
    } else if (mailController.text.isEmpty) {
      errorMessage = 'Mail is required.';
      isWarning = true;
    } else if (phoneController.text.isEmpty) {
      errorMessage = 'Phone is required.';
      isWarning = true;
    } else if (passwordController.text.isEmpty) {
      errorMessage = 'Password is required.';
      isWarning = true;
    }

    return isWarning;
  }

  @override
  void setContext(BuildContext context) {
    this._context = context;
  }
}
