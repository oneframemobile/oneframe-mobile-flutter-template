import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:networking/networking.dart';

import 'app/core/route/app_pages.dart';
import 'app/core/base/binding/base_binding.dart';

void main() {
  NetworkingFactory.init();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(
        WidgetsBinding.instance!.window.physicalSize.width,
        WidgetsBinding.instance!.window.physicalSize.height,
      ),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.splash,
        getPages: AppPages.pages,
        initialBinding: BaseBinding(),
      ),
    );
  }
}
