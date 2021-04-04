
import 'package:flutter/material.dart';
import 'package:flutter_provider/core/base/baseview.dart';
import 'package:flutter_provider/core/viewmodel/select_temp_view_model.dart';
import 'package:flutter_provider/shared/styles/colors/colors.dart';
import 'package:flutter_provider/shared/styles/text/styles.dart';
import 'package:flutter_provider/shared/widgets/button/raised_button.dart';
import 'package:lottie/lottie.dart';

class SelectTempView extends StatefulWidget {
  @override
  _SelectTempViewState createState() => _SelectTempViewState();
}

class _SelectTempViewState extends State<SelectTempView> {
  SelectTempViewModel _selectTempViewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<SelectTempViewModel>(
      onModelReady: (model) {
        _selectTempViewModel = model;
        model.setContext(context);
      },
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildClipRRect(
                    text: "OneFrame Template 1",
                    click: () {
                      _selectTempViewModel.goToLoginTemp1();
                    }),
                _lottieView,
                buildClipRRect(
                    text: "OneFrame Template 2",
                    click: () {
                      _selectTempViewModel.goToLoginTemp2();
                    }),
              ],
            ),
          ),
        );
      },
    );
  }

  ClipRRect buildClipRRect({String text, VoidCallback click}) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: RaisedGradientButton(
            height: 360,
            child: Text(
              text,
              style: loginButtonStyle2,
            ),
            gradient: LinearGradient(
              colors: selectTempButtonGradient,
            ),
            onPressed: () {
              click();
            }));
  }

  Widget get _lottieView => Lottie.asset(
    "assets/gif/line2.json",

  );
}

