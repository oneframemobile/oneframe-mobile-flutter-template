import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/ui_helper.dart';

class RaisedGradientButton extends StatelessWidget {
  final Widget child;
  final Gradient? gradient;
  final double? height;
  final double? iconHeight;
  final Function? onPressed;
  final EdgeInsetsGeometry? margin;
  final IconData? rightIcon;
  final IconData? leftIcon;
  final double radius;

  const RaisedGradientButton({
    Key? key,
    required this.child,
    this.gradient,
    this.height,
    this.iconHeight,
    this.onPressed,
    this.rightIcon,
    this.leftIcon,
    this.radius = 5,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => this.onPressed!(),
      child: Container(
        height: height ?? UIHelper.Space200.h,
        margin: this.margin,
        decoration: BoxDecoration(
            gradient: gradient,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[500]!,
                offset: Offset(0.0, 1.5),
                blurRadius: 1.5,
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(this.radius))),
        child: Material(
          color: Colors.transparent,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Icon(
                  this.leftIcon,
                  size: iconHeight ?? UIHelper.Space150.h,
                  color: Colors.white.withAlpha(150),
                ),
              ),
              Flexible(
                flex: 8,
                child: Center(
                  child: child,
                ),
              ),
              Flexible(
                child: Icon(this.rightIcon),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
