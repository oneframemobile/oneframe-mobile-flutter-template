import 'package:flutter/material.dart';
import 'package:flutter_provider/core/enum/viewstate.dart';
import 'package:flutter_provider/core/services/navigation.dart';

import '../../locator.dart';

abstract class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;
  ViewState get state => _state;

  NavigationService get navigator {
    return locator<NavigationService>();
  }

  void setState(ViewState state) {
    if (state == _state)
      return;
    else
      _state = state;
    notifyListeners();
  }

  void setContext(BuildContext context);


  @override
  void dispose() {
    super.dispose();
  }
}