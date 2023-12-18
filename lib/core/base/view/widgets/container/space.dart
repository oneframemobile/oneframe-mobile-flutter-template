import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/ui_helper.dart';

class Space extends StatelessWidget {
  const Space({
    Key? key,
    this.height,
  }) : super(key: key);

  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: (height ?? UIHelper.Space15).h);
  }
}
