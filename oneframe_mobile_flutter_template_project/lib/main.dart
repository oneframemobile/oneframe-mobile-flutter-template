import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:networking/networking.dart';
import 'package:oneframe_mobile_flutter_template_project/app/services/crashlytics/crashlytics_service.dart';
import 'package:oneframe_mobile_flutter_template_project/app/services/firebase_core/firebase_core_service.dart';

import 'app/core/base/binding/base_binding.dart';
import 'app/core/route/app_pages.dart';
import 'app/core/style/app_theme.dart';
import 'app/core/translation/app_translations.dart';
import 'app/services/push/fcm_service.dart';

/*
    Firebase Analytics kullanımı için eklediğiniz feature'ın controller'ında aşağıdaki namespace'i ekleyip,
    CodeGeneration'ın oluşturduğu base controller class'ında bulnan logEventFirebaseAnalytics method ile gerçekleştirebilirsiniz.
    import 'services/analytics/analytics_keys.dart';
    this.logEventFirebaseAnalytics(key: AnalytcisKeys.splash); 
*/
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseCoreService.init();
  FCMService.init();
  CrashlyticsService.init();
  NetworkingFactory.init();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(
        //NOT:03.07.2023 SEÇİLİ OLAN CİHAZIN BOYUTUNU GELİŞTİRME SONUNDA SABİT OLARAK VERMEK GEREKİYOR. TÜM CİHAZLAR BURDAKİ width ve height ÜZERİNDEN ÇİZİLİYOR.
        //Örnek olarak eğer IPHONE 14 PRO MAX ile geliştirme yapıyorsak width ve height bilgileri aşağıdaki gibidir.
        WidgetsBinding.instance!.window.physicalSize.width, //1290.0
        WidgetsBinding.instance!.window.physicalSize.height, //2796.0
      ),
      builder: (context, child) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.splash,
          getPages: AppPages.pages,
          initialBinding: BaseBinding(),
          locale: Get.deviceLocale,
          fallbackLocale: Locale('en', 'US'),
          translationsKeys: AppTranslation.translations,
          theme: darkThemeData),
    );
  }
}
