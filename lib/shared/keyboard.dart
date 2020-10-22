import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KeyboardChangeNotifier extends ValueNotifier<bool> {
  KeyboardChangeNotifier(bool value) : super(value);

  void changeState(bool val) {
    value = val;
    notifyListeners();
  }

  static void hideKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  static fieldFocusChange(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
    if (currentFocus != null && nextFocus != null) {
      currentFocus.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    }
  }
}
final keyboardChange = KeyboardChangeNotifier(false);
