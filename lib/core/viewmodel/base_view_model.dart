import 'package:flutter/material.dart';
import 'package:flutter_provider/core/enum/viewstate.dart';

abstract class BaseViewModel extends ChangeNotifier {
  ViewState _state = ViewState.Success;
  ViewState get state => _state;


  void setState(ViewState state) {
    if (state == _state)
      return;
    else
      _state = state;
    notifyListeners();
  }

  void setContext(BuildContext context);
}
