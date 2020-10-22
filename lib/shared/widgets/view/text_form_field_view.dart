import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_provider/shared/styles/colors/colors.dart';
import 'package:flutter_provider/shared/styles/text/styles.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    Key key,
    this.labelText,
    @required this.title,
    this.titleStyle,
    this.obscureText = false,
    this.textInputAction,
    this.textInputType,
    this.textEditingController,
    this.currentFocusNode,
    this.maxLines = 1,
    this.nextFocusNode,
    this.onActionCallback,
    this.actionIconData,
    this.leftIcon,
    this.inputFormatters,
  }) : super(key: key);

  final String labelText;
  final bool obscureText;
  final String title;
  final List<TextInputFormatter> inputFormatters;
  final TextStyle titleStyle;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final TextEditingController textEditingController;
  final FocusNode currentFocusNode;
  final int maxLines;
  final FocusNode nextFocusNode;
  final VoidCallback onActionCallback;
  final IconData actionIconData;
  final IconData leftIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        leftIcon != null
            ? Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  leftIcon,
                  color: lightBlue,
                  size: 20,
                ),
              )
            : Container(),
        Expanded(
          child: TextFormField(
            obscureText: obscureText,
            keyboardType: textInputType ?? TextInputType.text,
            textInputAction: textInputAction ?? TextInputAction.next,
            controller: textEditingController,
            focusNode: currentFocusNode,
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
              labelText: labelText,
              isDense: true,
              hintStyle: textStyle(context),
              suffixIcon: actionIconData != null
                  ? InkWell(
                      onTap: () {
                        onActionCallback();
                      },
                      child: Icon(actionIconData))
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
