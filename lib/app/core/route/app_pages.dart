import 'package:get/get.dart';

import '../../feature/authentication/binding/authentication_binding.dart';
import '../../feature/authentication/binding/forgot_password/forgot_password_binding.dart';
import '../../feature/authentication/binding/resend/email_binding.dart';
import '../../feature/authentication/binding/resend/sms_binding.dart';
import '../../feature/authentication/view/temp1/forgot_password/temp_1_forgot_password_view.dart';
import '../../feature/authentication/view/temp1/resend/temp_1_email_view.dart';
import '../../feature/authentication/view/temp1/resend/temp_1_sms_view.dart';
import '../../feature/authentication/view/temp1/temp_1_auth_view.dart';
import '../../feature/authentication/view/temp2/forgot_password/temp_2_forgot_password_view.dart';
import '../../feature/authentication/view/temp2/resend/temp_2_email_view.dart';
import '../../feature/authentication/view/temp2/resend/temp_2_sms_view.dart';
import '../../feature/authentication/view/temp2/temp_2_auth_view.dart';
import '../../feature/home/binding/home_binding.dart';
import '../../feature/home/view/home_view.dart';
import '../../feature/select_template/binding/select_template_binding.dart';
import '../../feature/select_template/view/select_template_view.dart';
import '../../feature/splash/binding/splash_binding.dart';
import '../../feature/splash/view/splash_view.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.selectTemplate,
      page: () => SelectTemplateView(),
      binding: SelectTemplateBinding(),
    ),
    GetPage(
      name: AppRoutes.temp1Auth,
      page: () => Temp1AuthView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: AppRoutes.temp1ForgotPassword,
      page: () => Temp1ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.temp1Email,
      page: () => Temp1EmailView(),
      binding: EmailBinding(),
    ),
    GetPage(
      name: AppRoutes.temp1Sms,
      page: () => Temp1SmsView(),
      binding: SmsBinding(),
    ),
    GetPage(
      name: AppRoutes.temp2Auth,
      page: () => Temp2AuthView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: AppRoutes.temp2ForgotPassword,
      page: () => Temp2ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.temp2Email,
      page: () => Temp2EmailView(),
      binding: EmailBinding(),
    ),
    GetPage(
      name: AppRoutes.temp2Sms,
      page: () => Temp2SmsView(),
      binding: SmsBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
