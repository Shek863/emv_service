import 'model/session_state.dart';
import 'package:flutter/material.dart';

class EmvSessionProcessor extends ChangeNotifier {
  int time = 0;

  SessionState state = SessionState.init;

  setState(SessionState state, {int time = 0}) {
    this.time = time;
    this.state = state;
    notifyListeners();
  }
}
