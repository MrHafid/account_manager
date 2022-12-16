import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'account_manager_method_channel.dart';

abstract class AccountManagerPlatform extends PlatformInterface {
  /// Constructs a AccountManagerPlatform.
  AccountManagerPlatform() : super(token: _token);

  static final Object _token = Object();

  static AccountManagerPlatform _instance = MethodChannelAccountManager();

  /// The default instance of [AccountManagerPlatform] to use.
  ///
  /// Defaults to [MethodChannelAccountManager].
  static AccountManagerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AccountManagerPlatform] when
  /// they register themselves.
  static set instance(AccountManagerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
