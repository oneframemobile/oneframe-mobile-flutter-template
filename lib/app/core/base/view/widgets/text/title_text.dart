import 'package:flutter/material.dart';

import '../../../../style/app_text_style.dart';
import '../container/space.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    Key? key,
    this.description,
    required this.title,
    this.titleStyle,
  }) : super(key: key);

  final String? description;
  final String title;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Space(height: 40),
        Text(
          this.title,
          style: titleStyle ?? welcomeTextStyle,
        ),
        Space(),
        this.description == null
            ? Space()
            : Text(description!, maxLines: 2, softWrap: true),
      ],
    );
  }
}
