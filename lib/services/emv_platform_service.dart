import 'dart:io';
import 'package:nfc_manager/nfc_manager.dart';

class EmvPlatformService {
  static Future<bool> isNfcEnabled() async {
    if (Platform.isAndroid) {
     return (await NfcManager.instance.isAvailable());
    }else{
      return false;
    }
  }
}
