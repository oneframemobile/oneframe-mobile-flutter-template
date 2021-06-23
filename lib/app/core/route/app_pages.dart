import 'package:get/get.dart';

import '../../feature/home/binding/home_binding.dart';
import '../../feature/home/view/home_view.dart';
import '../../feature/select_template/binding/select_template_binding.dart';
import '../../feature/select_template/view/select_template_view.dart';
import '../../feature/splash/binding/splash_binding.dart';
import '../../feature/splash/view/splash_view.dart';
import '../../feature/temp_1/binding/forgot_password/temp_1_forgot_password_binding.dart';
import '../../feature/temp_1/binding/resend/email/temp_1_email_binding.dart';
import '../../feature/temp_1/binding/resend/sms/temp_1_sms_binding.dart';
import '../../feature/temp_1/binding/temp_1_auth_binding.dart';
import '../../feature/temp_1/view/forgot_password/temp_1_forgot_password_view.dart';
import '../../feature/temp_1/view/resend/email/temp_1_email_view.dart';
import '../../feature/temp_1/view/resend/sms/temp_1_sms_view.dart';
import '../../feature/temp_1/view/temp_1_auth_view.dart';
import '../../feature/temp_2/binding/forgot_password/temp_2_forgot_password_binding.dart';
import '../../feature/temp_2/binding/resend/email/temp_2_email_binding.dart';
import '../../feature/temp_2/binding/resend/sms/temp_2_sms_binding.dart';
import '../../feature/temp_2/binding/temp_2_auth_binding.dart';
import '../../feature/temp_2/view/forgot_password/temp_2_forgot_password_view.dart';
import '../../feature/temp_2/view/resend/email/temp_2_email_view.dart';
import '../../feature/temp_2/view/resend/sms/temp_2_sms_view.dart';
import '../../feature/temp_2/view/temp_2_auth_view.dart';

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
      binding: Temp1AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.temp1ForgotPassword,
      page: () => Temp1ForgotPasswordView(),
      binding: Temp1ForgotPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.temp1Email,
      page: () => Temp1EmailView(),
      binding: Temp1EmailBinding(),
    ),
    GetPage(
      name: AppRoutes.temp1Sms,
      page: () => Temp1SmsView(),
      binding: Temp1SmsBinding(),
    ),
    GetPage(
      name: AppRoutes.temp2Auth,
      page: () => Temp2AuthView(),
      binding: Temp2AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.temp2ForgotPassword,
      page: () => Temp2ForgotPasswordView(),
      binding: Temp2ForgotPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.temp2Email,
      page: () => Temp2EmailView(),
      binding: Temp2EmailBinding(),
    ),
    GetPage(
      name: AppRoutes.temp2Sms,
      page: () => Temp2SmsView(),
      binding: Temp2SmsBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
