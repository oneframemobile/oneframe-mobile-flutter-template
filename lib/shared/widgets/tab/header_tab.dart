import 'package:flutter/material.dart';
import 'package:flutter_provider/shared/styles/text/styles.dart';

class HeaderTabWidget extends StatelessWidget {
  const HeaderTabWidget(
      {Key key,
      @required this.title,
      @required this.color,
       this.textColor})
      : super(key: key);

  final Color color;
  final Color textColor;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        color: this.color,
        child: Text(
          this.title,
          style: tabTextStyle,
        ),
      ),
    );
  }
}
