import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';

void main() {
  runApp(ExampleApp());
}

/// The wakelock implementation is located inside the [FlatButton.onPressed] functions and a [FutureBuilder].
/// The [FlatButton]'s and the [FutureBuilder] sit inside the [Column] that is a child of the [Scaffold] in [_ExampleAppState].
class ExampleApp extends StatefulWidget {
  const ExampleApp({Key key}) : super(key: key);

  @override
  _ExampleAppState createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  // The following code will enable the wakelock on Android or iOS using the wakelock plugin.
                  setState(() {
                    Wakelock.enable();
                    // You could also use Wakelock.toggle(on: true);
                  });
                },
                child: const Text('enable wakelock'),
              ),
              FlatButton(
                onPressed: () {
                  // The following code will disable the wakelock on Android or iOS using the wakelock plugin.
                  setState(() {
                    Wakelock.disable();
                    // You could also use Wakelock.toggle(on: false);
                  });
                },
                child: const Text('disable wakelock'),
              ),
              FutureBuilder(
                future: Wakelock.isEnabled,
                builder: (context, AsyncSnapshot<bool> snapshot) {
                  // The use of FutureBuilder is necessary here to await the bool value from isEnabled.
                  if (!snapshot.hasData)
                    return Container(); // The Future is retrieved so fast that you will not be able to see any loading indicator.
                  return Text(
                      'wakelock is currently ${snapshot.data ? 'enabled' : 'disabled'}');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
