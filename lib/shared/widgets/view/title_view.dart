import 'package:flutter/material.dart';
import 'package:flutter_provider/shared/styles/text/styles.dart';
import 'empty_view.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key key, this.description, @required this.title, this.titleStyle}) : super(key: key);

  final String description;
  final String title;
  final TextStyle titleStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SpaceView(height: 40),
        Text(
          this.title,
          style: titleStyle ?? welcomeTextStyle,
        ),
        SpaceView(),
        this.description == null ? SpaceView() : Text(description, maxLines: 2, softWrap: true),
      ],
    );
  }
}
