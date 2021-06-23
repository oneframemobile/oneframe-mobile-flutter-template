# Getting Started
OneFrame is a software development framework which is being developed by the teams that are part of KocSistem R&D Technology Architecture department. OneFrame teams aim to enable rapid application development by providing reusable components and services to be used by software developers. OneFrame teams guarantee the development, sustainability and maintainance of the components and services that are provided under OneFrame framework.

- *Flutter channel: stable*
- *Flutter version: 2.2.2*
- *Dart version: 2.13.3*

### State Management
The state management is GetX in use on this app. GetX is an extra-light and powerful solution for Flutter. It combines high-performance state management, intelligent dependency injection, and route management quickly and practically. For more detail check [this](https://pub.dev/packages/get).

### Features
- Splash
- Select Template
- Template 1
- Template 2
- Home

Features consist of 3 parts; binding, controller and view.

Bindings are classes where we can declare our dependencies and then ‘bind’ them to the routes. However, this means that we can only use it when using GetX for route management.

Controllers are classes where all our business logic goes. All the variables and methods are placed here and can be accessed from the view.

Views are the faces of the app. The users interact with them.

### Packages
- [GetX](https://pub.dev/packages/get) 
- [Networking](https://github.com/oneframemobile/networking.git)
- [Flutter Screenutil](https://pub.dev/packages/flutter_screenutil)
- [Url Launcher](https://pub.dev/packages/url_launcher)
- [Mask Text Input Formatter](https://pub.dev/packages/mask_text_input_formatter)
- [Lottie](https://pub.dev/packages/lottie)

### Folder Structure
```
flutter-app/
|- android
|- build
|- ios
|- lib
     |- app
          |- core
                |- base
                |- model
                |- route
                |- service
                |- style
                |- translation
                |- util
          |- feature
                   |- home
                   |- select_template
                   |- splash
                   |- temp_1
                   |- temp_2
|- test
```

### Routes
```
static const splash = '/';
static const selectTemplate = '/selectTemplate';

static const temp1Auth = '/temp1Auth';  
static const temp1ForgotPassword = '/temp1ForgotPassword';  
static const temp1Email = '/temp1Email';  
static const temp1Sms = '/temp1Sms';  

static const temp2Auth = '/temp2Auth';
static const temp2ForgotPassword = '/temp2ForgotPassword';  
static const temp2Email = '/temp2Email';  
static const temp2Sms = '/temp2Sms';
  
static const home = '/home';
```
![Routing](/assets/screenshot/routing.png?raw=true)


### Main
```
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:networking/networking.dart';

import 'app/core/base/binding/base_binding.dart';
import 'app/core/route/app_pages.dart';
import 'app/core/translation/app_translations.dart';

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
        locale: Locale('en', 'US'),
        translationsKeys: AppTranslation.translations,
      ),
    );
  }
}
```

### UI

Splash             |  Select Template | Home
:-------------------------:|:-------------------------:|:-------------------------:
![Splash](/assets/screenshot/splash.png?raw=true) | ![Select Template Dark](/assets/screenshot/selectTemplate.png?raw=true) | ![Home](/assets/screenshot/home.png?raw=true)

Temp1 Auth - Login Light | Temp1 Auth - Login Dark | Temp2 Auth - Login Light | Temp2 Auth - Login Dark
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![Temp1 Auth - Login Light](/assets/screenshot/temp1LoginLight.png?raw=true) | ![Temp1 Auth - Login Dark](/assets/screenshot/temp1LoginDark.png?raw=true) | ![Temp2 Auth - Login Light](/assets/screenshot/temp2LoginLight.png?raw=true) | ![Temp2 Auth - Login Dark](/assets/screenshot/temp2LoginDark.png?raw=true)


Temp1 Auth - Register Light | Temp1 Auth - Register Dark | Temp2 Auth - Register Light | Temp2 Auth - Register Dark
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![Temp1 Auth - Register Light](/assets/screenshot/temp1RegisterLight.png?raw=true) | ![Temp1 Auth - Register Dark](/assets/screenshot/temp1RegisterDark.png?raw=true) | ![Temp2 Auth - Register Light](/assets/screenshot/temp2RegisterLight.png?raw=true) | ![Temp2 Auth - Register Dark](/assets/screenshot/temp2RegisterDark.png?raw=true)


Temp1 Forgot Password Light | Temp1 Forgot Password Dark | Temp2 Forgot Password Light | Temp2 Forgot Password Dark
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![Temp1 Forgot Password Light](/assets/screenshot/temp1ForgotPasswordLight.png?raw=true) | ![Temp1 Forgot Password Dark](/assets/screenshot/temp1ForgotPasswordDark.png?raw=true) | ![Temp2 Forgot Password Light](/assets/screenshot/temp2ForgotPasswordLight.png?raw=true) | ![Temp2 Forgot Password Dark](/assets/screenshot/temp2ForgotPasswordDark.png?raw=true)


Temp1 Send Email Light | Temp1 Send Email Dark | Temp2 Send Email Light | Temp2 Send Email Dark
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![Temp1 Send Email Light](/assets/screenshot/temp1SendEmailLight.png?raw=true) | ![Temp1 Send Email Dark](/assets/screenshot/temp1SendEmailDark.png?raw=true) | ![Temp2 Send Email Light](/assets/screenshot/temp2SendEmailLight.png?raw=true) | ![Temp2 Send Email Dark](/assets/screenshot/temp2SendEmailDark.png?raw=true)


Temp1 Send Sms Light | Temp1 Send Sms Dark | Temp2 Send Sms Light | Temp2 Send Sms Dark
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![Temp1 Send Sms Light](/assets/screenshot/temp1SendSmsLight.png?raw=true) | ![Temp1 Send Sms Dark](/assets/screenshot/temp1SendSmsDark.png?raw=true) | ![Temp2 Send Sms Light](/assets/screenshot/temp2SendSmsLight.png?raw=true) | ![Temp2 Send Sms Dark](/assets/screenshot/temp2SendSmsDark.png?raw=true)