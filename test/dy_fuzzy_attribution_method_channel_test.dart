import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dy_fuzzy_attribution/dy_fuzzy_attribution_method_channel.dart';

void main() {
  MethodChannelDyFuzzyAttribution platform = MethodChannelDyFuzzyAttribution();
  const MethodChannel channel = MethodChannel('dy_fuzzy_attribution');

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
