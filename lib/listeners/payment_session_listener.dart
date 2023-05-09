import 'model/session_status.dart';
import 'package:flutter/cupertino.dart';

class PaymentSessionListener {
  void onTimeOut(BuildContext context) {}

  void onCNPComplete(BuildContext context) {}

  void onCPComplete(BuildContext context, SessionStatus status) {}
}
