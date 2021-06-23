import 'package:networking/networking.dart';
import 'package:networking/networking/network_manager.dart';

import '../../model/auth/request/login_request.dart';
import '../../model/auth/request/register_request.dart';
import '../../model/auth/response/login_response.dart';
import '../../model/error/error_response.dart';
import 'api_learning.dart';

class ApiService {
  late NetworkManager _manager;

  ApiService(
      {String baseUrl = "https://oneframe-livedemo-api.azurewebsites.net"}) {
    NetworkConfig _config = NetworkConfig()
      ..setBaseUrl(baseUrl)
      ..addSuccessCodes(200, 299);
    _manager = NetworkingFactory.create(config: _config);
    ApiLearning _learning = new ApiLearning();
    _manager.learning = _learning;
  }

  Future login({
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

  Future register({
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
