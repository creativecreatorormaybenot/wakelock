import 'package:flutter/material.dart';

void main() {
  runApp(WakelockExampleApp());
}

/// Example app widget demonstrating how to use the wakelock plugin.
class WakelockExampleApp extends StatefulWidget {
  @override
  _WakelockExampleAppState createState() => _WakelockExampleAppState();
}

class _WakelockExampleAppState extends State<WakelockExampleApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Wakelock example app'),
        ),
      ),
    );
  }
}
