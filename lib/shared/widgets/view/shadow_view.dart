import 'package:flutter/material.dart';
import 'package:flutter_provider/shared/styles/colors/colors.dart';

class ShadowWidget extends StatelessWidget {
  const ShadowWidget({
    Key key,
    this.child,
    this.color,
    this.elevation,
    this.padding,
  }) : super(key: key);

  final Widget child;
  final Color color;
  final double elevation;
  final double padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(this.padding ?? 5),
      child: Material(
          elevation: this.elevation ?? 10,
          shadowColor: this.color ?? shadowColor,
          child: this.child),
    );
  }
}
