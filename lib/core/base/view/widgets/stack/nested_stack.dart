import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/ui_helper.dart';

class NestedStack extends StatelessWidget {
  const NestedStack({
    Key? key,
    required this.backgroundImage,
    required this.childImage,
  }) : super(key: key);

  final String backgroundImage;
  final String childImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Image.asset(
          this.backgroundImage,
          height: UIHelper.Space800.h,
          width: double.infinity,
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
    );
  }
}
