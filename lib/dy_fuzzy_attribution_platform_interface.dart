import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'dy_fuzzy_attribution_method_channel.dart';

abstract class DyFuzzyAttributionPlatform extends PlatformInterface {
  /// Constructs a DyFuzzyAttributionPlatform.
  DyFuzzyAttributionPlatform() : super(token: _token);

  static final Object _token = Object();

  static DyFuzzyAttributionPlatform _instance = MethodChannelDyFuzzyAttribution();

  /// The default instance of [DyFuzzyAttributionPlatform] to use.
  ///
  /// Defaults to [MethodChannelDyFuzzyAttribution].
  static DyFuzzyAttributionPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DyFuzzyAttributionPlatform] when
  /// they register themselves.
  static set instance(DyFuzzyAttributionPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
