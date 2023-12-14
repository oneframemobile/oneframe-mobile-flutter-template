import 'package:url_launcher/url_launcher.dart';

import '../../../../core/base/controller/base_controller.dart';

class ForgotPasswordController extends BaseController {
  void sendMail() async {
    String url = "mailto:starforce@starforce.com";
    if (await canLaunch(url)) {
      await launch(url);
    } else {}
  }
}
