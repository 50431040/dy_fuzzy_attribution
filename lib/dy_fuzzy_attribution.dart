
import 'dy_fuzzy_attribution_platform_interface.dart';

class DyFuzzyAttribution {
  Future<String?> getPlatformVersion() {
    return DyFuzzyAttributionPlatform.instance.getPlatformVersion();
  }
}
