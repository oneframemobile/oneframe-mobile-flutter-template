import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocailButtonsWidget extends StatelessWidget {
  const SocailButtonsWidget(
      {Key key,
      @required this.onGooglePressed,
      @required this.onFacebookPressed,
      @required this.onTwitterPressed})
      : super(key: key);

  final VoidCallback onGooglePressed;
  final VoidCallback onFacebookPressed;
  final VoidCallback onTwitterPressed;
  @override
  Widget build(BuildContext context) {
    ScreenUtil()..init(context);
    final _height = ScreenUtil.getInstance().setHeight(150);
    final _spacing = ScreenUtil.getInstance().setHeight(30);
    return Wrap(
      spacing: _spacing,
      children: <Widget>[
        InkWell(
          onTap: this.onGooglePressed,
          child: Image.asset(
            "assets/images/google.png",
            height: _height,
          ),
        ),
        InkWell(
          onTap: this.onFacebookPressed,
          child: Image.asset(
            "assets/images/facebook.png",
            height: _height,
          ),
        ),
        InkWell(
          onTap: onTwitterPressed,
          child: Image.asset(
            "assets/images/twitter.png",
            height: _height,
          ),
        ),
      ],
    );
  }
}
