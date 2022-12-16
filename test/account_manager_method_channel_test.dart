import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:account_manager/account_manager_method_channel.dart';

void main() {
  MethodChannelAccountManager platform = MethodChannelAccountManager();
  const MethodChannel channel = MethodChannel('account_manager');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
