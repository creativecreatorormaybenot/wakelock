# wakelock [![Pub version](https://img.shields.io/pub/v/wakelock.svg)](https://pub.dev/packages/wakelock) [![GitHub stars](https://img.shields.io/github/stars/creativecreatorormaybenot/wakelock.svg)](https://github.com/creativecreatorormaybenot/wakelock)

Plugin that allows you to keep the device screen awake, i.e. prevent the screen from sleeping on
Android, iOS, and web.


This Flutter plugin allows you to enable and toggle the screen wakelock on Android and iOS, which prevents the screen from turning off automatically.  
Essentially, this allows you to keep the device awake, i.e. prevent the device from sleeping.

## Usage

To use this plugin, follow the [installing guide](https://pub.dev/packages/wakelock#-installing-tab-).

### Implementation

Everything in this plugin is controlled via the [`Wakelock` class](https://pub.dev/documentation/wakelock/latest/wakelock/Wakelock-class.html).  
If you want to enable the wakelock, i.e. keep the device awake, you can simply call [`Wakelock.enable`](https://pub.dev/documentation/wakelock/latest/wakelock/Wakelock/enable.html) 
and to disable it again, you can use [`Wakelock.disable`](https://pub.dev/documentation/wakelock/latest/wakelock/Wakelock/disable.html):

```dart
import 'package:wakelock/wakelock.dart';
// ...

// The following line will enable the Android and iOS wakelock.
Wakelock.enable();

// The next line disables the wakelock again.
Wakelock.disable();
```

For more advanced usage, you can pass a `bool` to [`Wakelock.toggle`](https://pub.dev/documentation/wakelock/latest/wakelock/Wakelock/toggle.html) to enable or disable the wakelock 
and also retrieve the current wakelock status using [`Wakelock.isEnabled`](https://pub.dev/documentation/wakelock/latest/wakelock/Wakelock/isEnabled.html):

```dart
import 'package:wakelock/wakelock.dart';
// ...

// The following lines of code toggle the wakelock based on a bool value.
bool on = true;
// The following statement enables the wakelock.
Wakelock.toggle(on: on);

on = false;
// The following statement disables the wakelock.
Wakelock.toggle(on: on);

// If you want to retrieve the current wakelock status,
// you will have to be in an async scope
// to await the Future returned by isEnabled.
bool isEnabled = await Wakelock.isEnabled;
```

If you want to wait for the wakelock toggle on Android or iOS to complete (which takes an insignificant amount of time), 
you can also `await` any of `Wakelock.enable`, `Wakelock.disable`, and `Wakelock.toggle`.
