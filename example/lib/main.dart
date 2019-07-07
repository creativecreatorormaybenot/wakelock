import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';

void main() => runApp(MyApp());

/// The wakelock implementation is located inside the [FlatButton.onPressed] functions and a [FutureBuilder].
/// The [FlatButton]'s and the [FutureBuilder] sit inside the [Column] that is a child of the [Scaffold] in [_MyAppState].
class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
          home: Scaffold(
              body: Center(
                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
        FlatButton(
          child: const Text('enable wakelock'),
          onPressed: () {
            // The following code will enable the wakelock on Android or iOS using the wakelock plugin.
            setState(() {
              Wakelock.enableWakelock();
            });
          },
        ),
        FlatButton(
          child: const Text('disable wakelock'),
          onPressed: () {
            // The following code will disable the wakelock on Android or iOS using the wakelock plugin.
            setState(() {
              Wakelock.disableWakelock();
            });
          },
        ),
        FutureBuilder(
          future: Wakelock.isWakelockEnabled,
          builder: (context, AsyncSnapshot<bool> snapshot) {
            // The use of FutureBuilder is necessary here to await the bool value from isWakelockEnabled.
            if (!snapshot.hasData) return Container(); // The Future is retrieved so fast that you will not be able to see any loading indicator.
            return Text('wakelock is currently ${snapshot.data ? 'enabled' : 'disabled'}');
          },
        )
      ]))));
}
