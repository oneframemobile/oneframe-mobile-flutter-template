import 'package:flutter/material.dart';

class NothcWidget extends StatelessWidget {
  NothcWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        width: 100,
        height: 5,
        decoration: BoxDecoration(color: Colors.grey[400], borderRadius: BorderRadius.all(Radius.circular(20))),
        alignment: Alignment.center,
      ),
    );
  }
}
