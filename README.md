# Wakelock [![](https://img.shields.io/pub/v/wakelock.svg)](https://pub.dev/packages/wakelock)

This plugin allows you to enable and toggle the Android and iOS screen wakelock, which prevents the screen from turning off automatically.

## Getting Started

Everything in this plugin is controlled via the [`Wakelock` class](https://pub.dev/documentation/wakelock/latest/wakelock/Wakelock-class.html).  
If you want to enable the wakelock, you can simply call [`Wakelock.enableWakelock`](https://pub.dev/documentation/wakelock/latest/wakelock/Wakelock/enableWakelock.html) and to disable it, you can use [`Wakelock.disableWakelock`](https://pub.dev/documentation/wakelock/latest/wakelock/Wakelock/disableWakelock.html):

```dart
import 'package:wakelock/wakelock.dart';
// ...

// The following line will enable the Android and iOS wakelock.
Wakelock.enableWakelock();

// The next line disables the wakelock again.
Wakelock.disableWakelock();
```

For more advanced usage, you can pass a `bool` to [`Wakelock.toggleWakelock`](https://pub.dev/documentation/wakelock/latest/wakelock/Wakelock/toggleWakelock.html) to enable or disable the wakelock and also retrieve the current wakelock status using [`Wakelock.isWakelockEnabled`](https://pub.dev/documentation/wakelock/latest/wakelock/Wakelock/isWakelockEnabled.html):

```dart
import 'package:wakelock/wakelock.dart';
// ...

// The following lines of code toggle the wakelock based on a bool value.
bool enableWakelock = true;
Wakelock.toggleWakelock(enableWakelock); // This statement enables the wakelock.

enableWakelock = false;
Wakelock.toggleWakelock(enableWakelock); // This statement disables the wakelock.

// If you want to retrieve the current wakelock status, you will have to be in an async scope to await the Future returned by isWakelockEnabled.
bool isWakelockEnabled = await Wakelock.isWakelockEnabled;
```

If you want to wait for the wakelock toggle on Android or iOS to complete (which takes an insignificant amount of time), you can also await either of `Wakelock.enableWakelock`, `Wakelock.disableWakelock`, and `Wakelock.toggleWakelock`.

## Note

This plugin is originally based on [`flutter_screen`](https://pub.dev/packages/screen).  
Specifically, the wakelock functionality was extracted into this plugin due to a lack of maintenance.