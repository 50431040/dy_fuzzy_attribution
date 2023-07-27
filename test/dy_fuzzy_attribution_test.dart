import 'package:flutter_test/flutter_test.dart';
import 'package:dy_fuzzy_attribution/dy_fuzzy_attribution.dart';
import 'package:dy_fuzzy_attribution/dy_fuzzy_attribution_platform_interface.dart';
import 'package:dy_fuzzy_attribution/dy_fuzzy_attribution_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDyFuzzyAttributionPlatform
    with MockPlatformInterfaceMixin
    implements DyFuzzyAttributionPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final DyFuzzyAttributionPlatform initialPlatform = DyFuzzyAttributionPlatform.instance;

  test('$MethodChannelDyFuzzyAttribution is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDyFuzzyAttribution>());
  });

  test('getPlatformVersion', () async {
    DyFuzzyAttribution dyFuzzyAttributionPlugin = DyFuzzyAttribution();
    MockDyFuzzyAttributionPlatform fakePlatform = MockDyFuzzyAttributionPlatform();
    DyFuzzyAttributionPlatform.instance = fakePlatform;

    expect(await dyFuzzyAttributionPlugin.getPlatformVersion(), '42');
  });
}
