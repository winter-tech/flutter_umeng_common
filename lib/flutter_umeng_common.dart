import 'package:flutter/services.dart';

class FlutterUmengCommon {
  static const MethodChannel _channel = MethodChannel('flutter_umeng_common');

  static Future<bool?> init({
    required String androidAppKey,
    required String iosAppKey,
    required String channel,
  }) async {
    try {
      return await _channel.invokeMethod<bool>('init', {
        'androidAppKey': androidAppKey,
        'iosAppKey': iosAppKey,
        'channel': channel,
      });
    } on PlatformException catch (e) {
      print('Failed to invoke init: ${e.message}');
      return false;
    }
  }

  static Future<bool> onEvent(String event, Map<String, dynamic> properties) async {
    try {
      return await _channel.invokeMethod('onEvent', {"event": event, "properties": properties});
    } on PlatformException catch (e) {
      print('Failed to invoke onEvent: ${e.message}');
      return false;
    }
  }
}
