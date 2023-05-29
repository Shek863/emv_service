import 'model/session_status.dart';
import 'package:flutter/material.dart';
import '../services/emv_session_processor.dart';

class PaymentSessionListener {
  void onTimeOut() {}

  void onCNPComplete() {}

  void onCPComplete(SessionStatus status) {}

  EmvSessionProcessor getProcessor() {
    return EmvSessionProcessor();
  }

  BuildContext? getContext() {
    return null;
  }
}
