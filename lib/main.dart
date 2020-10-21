import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_provider/router.dart' as rt;

import 'core/services/navigation.dart';
import 'locator.dart';
import 'ui/shared/widgets/view/my_behavior.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _applicationConfigure();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildMaterialApp;
  }

  MaterialApp get _buildMaterialApp {
    return MaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child,
        );
      },
      title: 'Oneframe Rapid Provider',
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: rt.Router.generateRoute,
      theme: ThemeData.light(),
    );
  }
}

Future _applicationConfigure() async {
  initLocator();
}
