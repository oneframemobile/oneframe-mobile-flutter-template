import 'dart:async';

import 'package:flutter_provider/core/api/bean/request/login_request.dart';
import 'package:flutter_provider/core/api/bean/response/login_response.dart';
import 'package:flutter_provider/core/api/service.dart';

class AuthenticationService {
  //final Service _api = Service.instance;

  StreamController<LoginResponse> userController =
      StreamController<LoginResponse>();

/*  Future<bool> login(LoginRequest loginRequest) async {
    var fetchedUser = await _api.login(loginRequest);

    var hasUser = fetchedUser != null;

    if (hasUser) {
      userController.add(fetchedUser);
    }

    return hasUser;
  }*/
}
