import 'package:flutter/material.dart';
import 'package:flutter_provider/app/core/style/app_color.dart';

class Shadow extends StatelessWidget {
  final Widget child;
  final Color color;
  final double elevation;
  final double padding;

  const Shadow({
    Key? key,
    required this.child,
    this.color = shadowColor,
    this.elevation = 10,
    this.padding = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: this.padding),
      child: Material(
        elevation: this.elevation,
        shadowColor: this.color,
        child: this.child,
      ),
    );
  }
}
