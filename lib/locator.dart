import 'package:flutter_provider/core/viewmodel/sms_view_model.dart';
import 'package:flutter_provider/core/viewmodel/select_temp_view_model.dart';
import 'package:flutter_provider/core/viewmodel/temp1_auth_view_model.dart';
import 'package:flutter_provider/core/viewmodel/temp1_forgot_view_model.dart';
import 'package:flutter_provider/core/viewmodel/temp1_login_view_model.dart';
import 'package:flutter_provider/core/viewmodel/temp1_register_view_model.dart';
import 'package:flutter_provider/core/viewmodel/temp1_sms_view_model.dart';
import 'package:get_it/get_it.dart';

import 'core/services/navigation.dart';
import 'core/viewmodel/authentication_view_model.dart';
import 'core/viewmodel/email_view_model.dart';
import 'core/viewmodel/forgot_password_view_model.dart';
import 'core/viewmodel/login_view_model.dart';
import 'core/viewmodel/profile_view_model.dart';
import 'core/viewmodel/select_city_view_model.dart';
import 'core/viewmodel/register_view_model.dart';
import 'core/viewmodel/splash_view_model.dart';
import 'core/viewmodel/temp1_email_view_model.dart';

GetIt locator = GetIt();

void initLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerFactory(() => SplashViewModel());
  locator.registerFactory(() => AuthenticationViewModel());
  locator.registerFactory(() => LoginViewModel());
  locator.registerFactory(() => RegisterViewModel());
  locator.registerFactory(() => ForgotPasswordViewModel());
  locator.registerFactory(() => ProfileViewModel());
  locator.registerFactory(() => SelectCityViewModel());
  locator.registerFactory(() => SmsViewModel());
  locator.registerFactory(() => EmailViewModel());
  locator.registerFactory(() => SelectTempViewModel());
  locator.registerFactory(() => Temp1AuthViewModel());
  locator.registerFactory(() => Temp1LoginViewModel());
  locator.registerFactory(() => Temp1RegisterViewModel());
  locator.registerFactory(() => Temp1ForgotViewModel());
  locator.registerFactory(() => Temp1EmailViewModel());
  locator.registerFactory(() => Temp1SmsViewModel());
}
