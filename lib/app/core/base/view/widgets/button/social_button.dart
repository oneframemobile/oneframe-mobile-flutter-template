import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/ui_helper.dart';

class SocailButton extends StatelessWidget {
  final VoidCallback? onGooglePressed;
  final VoidCallback? onFacebookPressed;
  final VoidCallback? onTwitterPressed;

  const SocailButton({
    Key? key,
    this.onGooglePressed,
    this.onFacebookPressed,
    this.onTwitterPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _height = UIHelper.Space150.h;
    final _spacing = UIHelper.Space30.w;

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
