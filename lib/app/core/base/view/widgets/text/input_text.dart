import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../style/app_color.dart';
import '../../../../style/app_text_style.dart';

class InputText extends StatelessWidget {
  final String? labelText;
  final bool obscureText;
  final TextStyle? titleStyle;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final TextEditingController? textEditingController;
  final FocusNode? currentFocusNode;
  final int maxLines;
  final FocusNode? nextFocusNode;
  final VoidCallback? onActionCallback;
  final IconData? actionIconData;
  final IconData? leftIcon;
  final List<TextInputFormatter>? inputFormatters;

  const InputText({
    Key? key,
    this.labelText,
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
              hintStyle: forgotTextStyle,
              suffixIcon: actionIconData != null
                  ? InkWell(
                      onTap: onActionCallback,
                      child: Icon(actionIconData),
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
