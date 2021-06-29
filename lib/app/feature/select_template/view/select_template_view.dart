import 'package:flutter/material.dart';
import 'package:flutter_provider/app/core/route/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../core/base/view/widgets/button/raised_gradient_button.dart';
import '../../../core/style/app_color.dart';
import '../../../core/style/app_text_style.dart';
import '../../../core/translation/localization_key.dart';
import '../../../core/util/ui_helper.dart';
import '../controller/select_template_controller.dart';

class SelectTemplateView extends GetView<SelectTemplateController> {

  ClipRRect buildClipRRect({String? text, VoidCallback? click}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: RaisedGradientButton(
        height: UIHelper.Space750.h,
        child: Text(
          text!,
          style: loginButtonStyle2,
          textAlign: TextAlign.center,
        ),
        gradient: LinearGradient(
          colors: selectTempButtonGradient,
        ),
        onPressed: click!,
      ),
    );
  }

  Widget get _lottieView => Lottie.asset("assets/gif/line2.json");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: UIHelper.Space120.w,
          vertical: UIHelper.Space100.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(bottom: UIHelper.Space20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: controller.onThemeTapped,
                      child: Icon(Icons.palette),
                    ),
                    SizedBox(width: UIHelper.Space20.w),
                    InkWell(
                      onTap: controller.onLocalizationTapped,
                      child: Icon(Icons.language),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 5,
              child: buildClipRRect(
                text: LocalizationKey.Template1.tr,
                click: () =>
                    controller.navigateToView(path: AppRoutes.temp1Auth),
              ),
            ),
            _lottieView,
            Flexible(
              flex: 5,
              child: buildClipRRect(
                text: LocalizationKey.Template2.tr,
                click: () =>
                    controller.navigateToView(path: AppRoutes.temp2Auth),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
