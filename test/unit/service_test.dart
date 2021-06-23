import 'package:flutter_provider/app/core/model/auth/request/login_request.dart';
import 'package:flutter_provider/app/core/model/auth/response/login_response.dart';
import 'package:flutter_provider/app/core/service/api/api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:networking/networking.dart';

void main() {
  final ApiService _service = ApiService();

  test("Successful Login", () async {
    bool isLoggedIn = false;

    LoginRequest loginRequest = new LoginRequest(
      email: "adminuser@kocsistem.com.tr",
      password: "123456",
    );

    await _service
        .login(
          loginRequest: loginRequest,
          listener: NetworkListener().onSuccess((ResultModel result) {
            if (result.data is LoginResponse) {
              isLoggedIn = true;
            }
          }).onError((ErrorModel error) {
            isLoggedIn = false;
          }),
        )
        .then(
          (value) => expect(isLoggedIn, true),
        );
  });
}