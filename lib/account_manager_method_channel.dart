import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'account_manager_platform_interface.dart';

/// An implementation of [AccountManagerPlatform] that uses method channels.
class MethodChannelAccountManager extends AccountManagerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('account_manager');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
