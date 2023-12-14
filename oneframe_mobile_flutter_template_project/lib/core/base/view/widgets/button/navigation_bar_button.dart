import 'package:flutter/material.dart';

class NavigationBarButton extends StatelessWidget {
  final Function onPressed;
  final IconData iconData;
  final String text;
  final Color color;

  const NavigationBarButton({
    Key? key,
    required this.onPressed,
    required this.iconData,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 40,
      onPressed: () => onPressed(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(iconData, color: color),
          Text(text, style: TextStyle(color: color)),
        ],
      ),
    );
  }
}
