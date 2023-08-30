import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_log/flutter_log.dart';
import 'package:flutter_log/flutter_log_platform_interface.dart';
import 'package:flutter_log/flutter_log_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterLogPlatform
    with MockPlatformInterfaceMixin
    implements FlutterLogPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterLogPlatform initialPlatform = FlutterLogPlatform.instance;

  test('$MethodChannelFlutterLog is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterLog>());
  });

  test('getPlatformVersion', () async {
    FlutterLog flutterLogPlugin = FlutterLog();
    MockFlutterLogPlatform fakePlatform = MockFlutterLogPlatform();
    FlutterLogPlatform.instance = fakePlatform;

    expect(await flutterLogPlugin.getPlatformVersion(), '42');
  });
}
