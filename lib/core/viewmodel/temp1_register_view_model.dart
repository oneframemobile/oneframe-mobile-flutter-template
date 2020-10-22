import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_provider/core/api/bean/request/register_request.dart';
import 'package:flutter_provider/core/api/bean/response/login_response.dart';
import 'package:flutter_provider/core/api/service.dart';
import 'package:flutter_provider/core/base/base_model.dart';
import 'package:flutter_provider/core/enum/page_named.dart';
import 'package:flutter_provider/core/enum/viewstate.dart';
import 'package:networking/networking/network_listener.dart';

class Temp1RegisterViewModel extends BaseModel {
  BuildContext _context;

  BuildContext get context => _context;

  final Service _service = Service();
  String errorMessage;
  LoginResponse registerResponse;
  bool visibiltyField = false;

  RegisterRequest registerRequest = new RegisterRequest();

  var nameController = TextEditingController();
  var surnameController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var mailController = TextEditingController();

  void changeVisibility() {
    visibiltyField = !visibiltyField;
    notifyListeners();
  }

  registerUser() async {
    setState(ViewState.Loading);

    if (nameController.text.isEmpty || surnameController.text.isEmpty || mailController.text.isEmpty || phoneController.text.isEmpty || passwordController.text.isEmpty) {
      final scaffold = Scaffold.of(context);
      scaffold.showSnackBar(
        SnackBar(
          content: Text("Tüm alanları doldurun"),
        ),
      );
      setState(ViewState.Idle);
    } else {
      Future.delayed(Duration(seconds: 1), () async {
        registerRequest.name = nameController.text;
        registerRequest.surname = surnameController.text;
        registerRequest.email = mailController.text;
        registerRequest.phoneNumber = phoneController.text;
        registerRequest.password = passwordController.text;
        await _service.register(
            registerRequest: registerRequest,
            listener: new NetworkListener()
              ..onSuccess((dynamic result) {
                setState(ViewState.Idle);
                print("accounts/register onsuccess");
                navigator.navigateToRemove(Pages.Home);
              })
              ..onError((dynamic error) {
                setState(ViewState.Idle);
                print("accounts/register onerror");
              }));
      });
    }
  }

  @override
  void setContext(BuildContext context) {
    this._context = context;
  }
}
