import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_log_platform_interface.dart';

/// An implementation of [FlutterLogPlatform] that uses method channels.
class MethodChannelFlutterLog extends FlutterLogPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_log');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> getPlatformLog() async {
    final log = await methodChannel.invokeMethod<String>('getPlatformLog');
    return log;
  }
}
