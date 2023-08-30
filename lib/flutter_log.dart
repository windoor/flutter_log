import 'flutter_log_platform_interface.dart';

class FlutterLog {
  Future<String?> getPlatformVersion() {
    return FlutterLogPlatform.instance.getPlatformVersion();
  }

  Future<String?> getPlatformLog() {
    return FlutterLogPlatform.instance.getPlatformLog();
  }
}
