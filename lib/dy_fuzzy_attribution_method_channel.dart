import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'dy_fuzzy_attribution_platform_interface.dart';

/// An implementation of [DyFuzzyAttributionPlatform] that uses method channels.
class MethodChannelDyFuzzyAttribution extends DyFuzzyAttributionPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('dy_fuzzy_attribution');

  @override
  Future<String?> getIOSStartTime() async {
    if (Platform.isIOS) {
      final time = await methodChannel.invokeMethod<int?>('getIOSStartTime');
      return time?.toString();
    }

    return null;
  }

  @override
  Future<String?> getIOSSystemUpdateTime() async {
    if (Platform.isIOS) {
      final time =
          await methodChannel.invokeMethod<String?>('getIOSystemUpdateTime');
      return time;
    }

    return null;
  }

  @override
  Future<String?> getUserAgent() async {
    if (Platform.isIOS) {
      return await methodChannel.invokeMethod<String?>('getUserAgent');
    }

    return null;
  }

  @override
  Future<String?> getIDFA() async {
    if (Platform.isIOS) {
      return await methodChannel.invokeMethod<String?>('getIDFA');
    }

    return null;
  }

  @override
  Future<String?> getPlatform() async {
    if (Platform.isIOS) {
      return await methodChannel.invokeMethod<String?>('getPlatform');
    }

    return null;
  }

  @override
  Future<String?> getIP() async {
    if (Platform.isIOS) {
      return methodChannel.invokeMethod<String?>('getIP');
    }

    return null;
  }
}
