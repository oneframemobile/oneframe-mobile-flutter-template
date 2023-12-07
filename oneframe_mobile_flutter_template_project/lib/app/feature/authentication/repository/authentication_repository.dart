import 'package:networking/networking/network_listener.dart';

import '../../../services/api/oneframe_api_manager.dart';
import '../../../core/base/repository/base_repository.dart';
import '../../../core/model/auth/request/login_request.dart';
import '../../../core/model/auth/request/register_request.dart';

class AuthenticationRepository extends BaseRepository {
  late OneFrameApiManager _manager;

  AuthenticationRepository(OneFrameApiManager manager) {
    this._manager = manager;
  }

  login({
    required LoginRequest loginRequest,
    required NetworkListener listener,
  }) async {
    await _manager.login(
      loginRequest: loginRequest,
      listener: listener,
    );
  }

  register({
    required RegisterRequest registerRequest,
    required NetworkListener listener,
  }) async {
    await _manager.register(
      registerRequest: registerRequest,
      listener: listener,
    );
  }
}
