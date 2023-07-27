import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'dy_fuzzy_attribution_platform_interface.dart';

/// An implementation of [DyFuzzyAttributionPlatform] that uses method channels.
class MethodChannelDyFuzzyAttribution extends DyFuzzyAttributionPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('dy_fuzzy_attribution');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
