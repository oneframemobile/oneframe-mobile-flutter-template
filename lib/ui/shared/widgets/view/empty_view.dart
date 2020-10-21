import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpaceView extends StatelessWidget {
  const SpaceView({
    Key key,
    this.height,
  }) : super(key: key);
  final double height;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    return SizedBox(height: ScreenUtil.instance.setHeight(height ?? 15));
  }
}
