

import 'package:flutter_provider/core/session/session_state.dart';

abstract class SessionObserver {
  void onUpdate(SessionState state);
}
