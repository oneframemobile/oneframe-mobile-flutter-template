import 'package:flutter/material.dart';

class KeyboardHider extends StatelessWidget {
  final Widget? child;

  const KeyboardHider({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode focus = FocusScope.of(context);

        if (!focus.hasPrimaryFocus) {
          focus.unfocus();
        }
      },
      child: child,
    );
  }
}
