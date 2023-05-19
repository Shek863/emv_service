import 'dart:io';
import 'package:platform_device_id/platform_device_id.dart';

class EmvPlatformService {
  static Future<bool> isNfcEnabled() async {
    /*if (Platform.isAndroid) {
     return (await NfcManager.instance.isAvailable());
    }*/
    return (true);
  }

  static Future<String?> getDeviceId() async {
    return await PlatformDeviceId.getDeviceId;
  }
}
