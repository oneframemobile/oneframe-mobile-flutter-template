import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NestedStackWidget extends StatelessWidget {
  const NestedStackWidget(
      {Key key, @required this.backgroundImage, @required this.childImage})
      : super(key: key);

  final String backgroundImage;
  final String childImage;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
          alignment: Alignment.center,
      children: <Widget>[
        Image.asset(
          this.backgroundImage,
          height: ScreenUtil.instance.setHeight(800),
          width: ScreenUtil.screenWidth,
          fit: BoxFit.fill,
        ),
        Positioned.fill(
          child: Container(
            alignment: Alignment.center,
            child: Image.asset(
              this.childImage,
            ),
          ),
        ),
      ],
    ));
  }
}
