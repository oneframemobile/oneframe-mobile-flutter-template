import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _lottieView;
  }

  Widget get _lottieView => Lottie.asset(
        "assets/gif/loading.json",
      );
}
