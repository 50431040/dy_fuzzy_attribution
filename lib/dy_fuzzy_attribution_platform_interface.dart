import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'dy_fuzzy_attribution_method_channel.dart';

abstract class DyFuzzyAttributionPlatform {
  static final DyFuzzyAttributionPlatform _instance =
      MethodChannelDyFuzzyAttribution();

  static DyFuzzyAttributionPlatform get instance => _instance;

  /// 获取iOS设备启动时间
  Future<String?> getIOSStartTime() {
    throw UnimplementedError('getIOSStartTime() has not been implemented.');
  }

  /// 获取iOS系统更新时间
  Future<String?> getIOSSystemUpdateTime() {
    throw UnimplementedError(
        'getIOSystemUpdateTime() has not been implemented.');
  }

  /// 获取UA
  Future<String?> getUserAgent() {
    throw UnimplementedError('getUserAgent() has not been implemented.');
  }

  /// 获取IDFA
  Future<String?> getIDFA() {
    throw UnimplementedError('getIDFA() has not been implemented.');
  }

  /// 获取设备编码
  Future<String?> getPlatform() {
    throw UnimplementedError('getPlatform() has not been implemented.');
  }

  /// 获取IP
  Future<String?> getIP() {
    throw UnimplementedError('getIP() has not been implemented.');
  }
}
