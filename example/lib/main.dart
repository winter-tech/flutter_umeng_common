import 'package:flutter/material.dart';
import 'package:flutter_umeng_common/flutter_umeng_common.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    FlutterUmengCommon.init(
      androidAppKey: 'xxxxxx',
      iosAppKey: 'xxxxxx',
      channel: 'xiaomi',
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: GestureDetector(
              onTap: () {
                FlutterUmengCommon.onEvent('test', {
                  'test': 'test',
                  'test1': "124",
                });
              },
              child: Text('onEvent')),
        ),
      ),
    );
  }
}
