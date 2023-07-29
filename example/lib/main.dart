import 'package:flutter/material.dart';
import 'package:dy_fuzzy_attribution/dy_fuzzy_attribution.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// 获取启动时间
  getIOSStartTime() async {
    var time = await DyFuzzyAttribution().getIOSStartTime();
    debugPrint("getIOSStartTime -> $time");
  }

  /// 获取系统更新时间
  getIOSSystemUpdateTime() async {
    var time = await DyFuzzyAttribution().getIOSSystemUpdateTime();
    debugPrint("getIOSSystemUpdateTime -> $time");
  }

  /// 获取UA
  getUserAgent() async {
    var userAgent = await DyFuzzyAttribution().getUserAgent();
    debugPrint("getUserAgent -> $userAgent");
  }

  /// 获取IDFA
  getIDFA() async {
    var idfa = await DyFuzzyAttribution().getIDFA();
    debugPrint("getIDFA -> $idfa");
  }

  /// 获取iOS设备编码
  getPlatform() async {
    var platform = await DyFuzzyAttribution().getPlatform();
    debugPrint("getPlatform -> $platform");
  }

  /// 获取IP
  getIP() async {
    var ip = await DyFuzzyAttribution().getIP();
    debugPrint("getIP -> $ip");
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('demo'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: getIOSStartTime,
              child: const Text("获取iOS设备启动时间"),
            ),
            ElevatedButton(
              onPressed: getIOSSystemUpdateTime,
              child: const Text("获取iOS更新系统时间"),
            ),
            ElevatedButton(
              onPressed: getUserAgent,
              child: const Text("获取UA"),
            ),
            ElevatedButton(
              onPressed: getIDFA,
              child: const Text("获取IDFA"),
            ),
            ElevatedButton(
              onPressed: getPlatform,
              child: const Text("获取iOS设备编码"),
            ),
            ElevatedButton(
              onPressed: getIP,
              child: const Text("获取IP"),
            ),
          ],
        ),
      ),
    );
  }
}
