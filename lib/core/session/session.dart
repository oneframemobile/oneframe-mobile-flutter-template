

import 'package:flutter_provider/core/session/session_observer.dart';
import 'package:flutter_provider/core/session/session_state.dart';

class Session {
  static final Session instance = Session._internal();

  List<SessionObserver> _observers;

  Session._internal() {
    _observers = List();
  }

  register(SessionObserver observer) {
    _observers.add(observer);
  }

  unregister(SessionObserver observer) {
    _observers.remove(observer);
  }

  void notify(SessionState state) {
    _observers.forEach((observer) {
      observer.onUpdate(state);
    });
  }
}
