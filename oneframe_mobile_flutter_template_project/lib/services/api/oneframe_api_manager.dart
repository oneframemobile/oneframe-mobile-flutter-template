import 'package:networking/networking.dart';
import 'package:networking/networking/network_manager.dart';

import '../../core/model/auth/request/login_request.dart';
import '../../core/model/auth/request/register_request.dart';
import '../../core/model/auth/response/login_response.dart';
import '../../core/model/error/error_response.dart';
import 'oneframe_api_learning.dart';

class OneFrameApiManager {
  late NetworkManager _manager;

  OneFrameApiManager(
      {String baseUrl = "https://oneframe-livedemo-api.azurewebsites.net"}) {
    NetworkConfig _config = NetworkConfig()
      ..setBaseUrl(baseUrl)
      ..addSuccessCodes(200, 299);
    _manager = NetworkingFactory.create(config: _config);
    OneFrameApiLearning _learning = new OneFrameApiLearning();
    _manager.learning = _learning;
  }

  login({
    required LoginRequest loginRequest,
    required NetworkListener listener,
  }) async {
    await _manager
        .post<LoginRequest, LoginResponse, ErrorResponse>(
          url: "/accounts/login",
          type: LoginResponse(),
          errorType: ErrorResponse(),
          body: loginRequest,
          listener: listener,
        )
        .fetch();
  }

  register({
    required RegisterRequest registerRequest,
    required NetworkListener listener,
  }) async {
    await _manager
        .post<RegisterRequest, LoginResponse, ErrorResponse>(
          url: "/accounts/register",
          type: LoginResponse(),
          errorType: ErrorResponse(),
          body: registerRequest,
          listener: listener,
        )
        .fetch();
  }
}
