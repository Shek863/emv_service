import 'model/session_status.dart';
import 'package:flutter/cupertino.dart';

class PaymentSessionListener {
  void onTimeOut() {}

  void onCNPComplete() {}

  void onCPComplete(SessionStatus status) {}

  void onProcess(Navigator route) {}
}
