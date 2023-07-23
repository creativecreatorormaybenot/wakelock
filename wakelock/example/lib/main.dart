import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';

void main() {
  runApp(const WakelockExampleApp());
}

/// Example app widget demonstrating how to use the wakelock plugin.
///
/// The example implementation is located inside [OutlinedButton.onPressed]
/// callback functions and a [FutureBuilder].
class WakelockExampleApp extends StatefulWidget {
  /// Creates the [WakelockExampleApp] widget.
  const WakelockExampleApp({Key? key}) : super(key: key);

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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Spacer(
                flex: 3,
              ),
              OutlinedButton(
                onPressed: () {
                  // The following code will enable the wakelock on the device
                  // using the wakelock plugin.
                  setState(() {
                    Wakelock.enable();
                    // You could also use Wakelock.toggle(on: true);
                  });
                },
                child: const Text('enable wakelock'),
              ),
              const Spacer(),
              OutlinedButton(
                onPressed: () {
                  // The following code will disable the wakelock on the device
                  // using the wakelock plugin.
                  setState(() {
                    Wakelock.disable();
                    // You could also use Wakelock.toggle(on: false);
                  });
                },
                child: const Text('disable wakelock'),
              ),
              const Spacer(
                flex: 2,
              ),
              FutureBuilder(
                future: Wakelock.enabled,
                builder: (context, AsyncSnapshot<bool> snapshot) {
                  final data = snapshot.data;
                  // The use of FutureBuilder is necessary here to await the
                  // bool value from the `enabled` getter.
                  if (data == null) {
                    // The Future is retrieved so fast that you will not be able
                    // to see any loading indicator.
                    return Container();
                  }

                  return Text('The wakelock is currently '
                      '${data ? 'enabled' : 'disabled'}.');
                },
              ),
              const Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
