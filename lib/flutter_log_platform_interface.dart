import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_log_method_channel.dart';

abstract class FlutterLogPlatform extends PlatformInterface {
  /// Constructs a FlutterLogPlatform.
  FlutterLogPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterLogPlatform _instance = MethodChannelFlutterLog();

  /// The default instance of [FlutterLogPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterLog].
  static FlutterLogPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterLogPlatform] when
  /// they register themselves.
  static set instance(FlutterLogPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getPlatformLog() {
    throw UnimplementedError('getPlatformLog() has not been implemented.');
  }
}
