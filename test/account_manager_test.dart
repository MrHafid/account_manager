import 'package:flutter_test/flutter_test.dart';
import 'package:account_manager/account_manager.dart';
import 'package:account_manager/account_manager_platform_interface.dart';
import 'package:account_manager/account_manager_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAccountManagerPlatform
    with MockPlatformInterfaceMixin
    implements AccountManagerPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AccountManagerPlatform initialPlatform =
      AccountManagerPlatform.instance;

  test('$MethodChannelAccountManager is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAccountManager>());
  });

  test('getPlatformVersion', () async {
    AccountManager accountManagerPlugin = AccountManager();
    MockAccountManagerPlatform fakePlatform = MockAccountManagerPlatform();
    AccountManagerPlatform.instance = fakePlatform;

    // expect(await accountManagerPlugin.getPlatformVersion(), '42');
  });
}
