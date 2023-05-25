import 'model/session_status.dart';
import 'package:flutter/material.dart';
import '../services/emv_session_processor.dart';

class PaymentSessionListener {
  //void detach(){}

  //void onTimeOut() {}

  void onCNPComplete() {}

  void onCPComplete(SessionStatus status) {}

  //void onProcess(MaterialPageRoute route) {}

  EmvSessionProcessor getProcessor() {
    return EmvSessionProcessor();
  }

  BuildContext? getContext() {
    return null;
  }
}
