import 'dy_fuzzy_attribution_platform_interface.dart';

class DyFuzzyAttribution {
  /// 获取iOS设备启动时间
  Future<String?> getIOSStartTime() {
    return DyFuzzyAttributionPlatform.instance.getIOSStartTime();
  }

  /// 获取iOS系统更新时间
  Future<String?> getIOSSystemUpdateTime() {
    return DyFuzzyAttributionPlatform.instance.getIOSSystemUpdateTime();
  }

  /// 获取UA
  Future<String?> getUserAgent() {
    return DyFuzzyAttributionPlatform.instance.getUserAgent();
  }

  /// 获取IDFA
  Future<String?> getIDFA() {
    return DyFuzzyAttributionPlatform.instance.getIDFA();
  }

  /// 获取设备编码
  Future<String?> getPlatform() {
    return DyFuzzyAttributionPlatform.instance.getPlatform();
  }

  /// 获取IP
  Future<String?> getIP() {
    return DyFuzzyAttributionPlatform.instance.getIP();
  }
}
