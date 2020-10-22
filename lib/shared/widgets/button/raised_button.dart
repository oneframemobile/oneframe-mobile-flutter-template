import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RaisedGradientButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final double height;
  final Function onPressed;
  final EdgeInsetsGeometry margin;
  final IconData rightIcon;
  final IconData leftIcon;
  final double radius;

  const RaisedGradientButton(
      {Key key,
      @required this.child,
      this.gradient,
      this.height = 120.0,
      this.onPressed,
      this.rightIcon,
      this.leftIcon,
      this.radius = 5,
      this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.instance.setHeight(this.height),
      margin: this.margin,
      decoration: BoxDecoration(
          gradient: gradient,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[500],
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
                this.rightIcon,
                size: ScreenUtil.getInstance().setSp(60),
                color: Colors.white.withAlpha(150),
              ),
            ),
            Flexible(
              flex: 8,
              child: InkWell(
                onTap: this.onPressed,
                child: Center(
                  child: child,
                ),
              ),
            ),
            Flexible(
              child: Icon(this.leftIcon),
            ),
          ],
        ),
      ),
    );
  }
}
