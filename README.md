# Wakelock [![](https://img.shields.io/pub/v/wakelock.svg)](https://pub.dev/packages/wakelock)

This plugin allows you to enable and toggle the Android and iOS screen wakelock, which prevents the screen from turning off automatically.

## Usage

To use this plugin, follow the [installing guide](https://pub.dev/packages/wakelock#-installing-tab-).

### Implementation

Everything in this plugin is controlled via the [`Wakelock` class](https://pub.dev/documentation/wakelock/latest/wakelock/Wakelock-class.html).  
If you want to enable the wakelock, you can simply call [`Wakelock.enable`](https://pub.dev/documentation/wakelock/latest/wakelock/Wakelock/enable.html) and to disable it, you can use [`Wakelock.disable`](https://pub.dev/documentation/wakelock/latest/wakelock/Wakelock/disable.html):

```dart
import 'package:wakelock/wakelock.dart';
// ...

// The following line will enable the Android and iOS wakelock.
Wakelock.enable();

// The next line disables the wakelock again.
Wakelock.disable();
```

For more advanced usage, you can pass a `bool` to [`Wakelock.toggle`](https://pub.dev/documentation/wakelock/latest/wakelock/Wakelock/toggle.html) to enable or disable the wakelock and also retrieve the current wakelock status using [`Wakelock.isEnabled`](https://pub.dev/documentation/wakelock/latest/wakelock/Wakelock/isEnabled.html):

```dart
import 'package:wakelock/wakelock.dart';
// ...

// The following lines of code toggle the wakelock based on a bool value.
bool enable = true;
// The following statement enables the wakelock.
Wakelock.toggle(enable);

enable = false;
// The following statement disables the wakelock.
Wakelock.toggle(enable);

// If you want to retrieve the current wakelock status,
// you will have to be in an async scope
// to await the Future returned by isEnabled.
bool isEnabled = await Wakelock.isEnabled;
```

If you want to wait for the wakelock toggle on Android or iOS to complete (which takes an insignificant amount of time), you can also await either of `Wakelock.enable`, `Wakelock.disable`, and `Wakelock.toggle`.

## Note

This plugin is originally based on [`screen`](https://pub.dev/packages/screen).  
Specifically, the wakelock functionality was extracted into this plugin due to a lack of maintenance.