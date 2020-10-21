import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_provider/core/base/baseview.dart';
import 'package:flutter_provider/core/viewmodel/splash_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashViewModel _splashViewModel;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance.init(context);
    return BaseView<SplashViewModel>(
      onModelReady: (model) {
        _splashViewModel = model;
        model.setContext(context);
      },
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: Image.asset(
              "assets/images/starforce.png",
            ),
          ),
        );
      },
    );
  }
}
