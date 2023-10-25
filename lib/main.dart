import 'dart:io';

import 'package:flutter/material.dart';
import 'package:untitled/test_helper.dart';
import 'package:untitled/test_http_helper.dart';
import 'package:untitled/test_isolate_helper.dart';
import 'package:untitled/toggle_button.dart';

void main() {
  HttpClient.enableTimelineLogging = false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Isolate Memory',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    TestHelper.test();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ToggleButton(
              toggle: () {
                return TestIsolateHelper.toggle();
              },
              isActive: () {
                return TestIsolateHelper.isActive;
              },
              activeText: 'startIsolate',
              unActiveText: 'closeIsolate',
            ),
            ElevatedButton(
                onPressed: () {
                  const url = 'https://video-previews.elements.envatousercontent.com/files/94ce7280-f6e5-4c85-ad75-911a1f9cae1c/video_preview_h264.mp4';
                  TestHttpHelper.startHttpRequest(url);
                }, child: const Text('startHttpRequest'))
          ],
        ),
      ),
    );
  }
}
