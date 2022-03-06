# wakelock [![Pub version](https://img.shields.io/pub/v/wakelock.svg)](https://pub.dev/packages/wakelock) [![GitHub stars](https://img.shields.io/github/stars/creativecreatorormaybenot/wakelock.svg)](https://github.com/creativecreatorormaybenot/wakelock) [![Twitter Follow](https://img.shields.io/twitter/follow/creativemaybeno?label=Follow&style=social)](https://twitter.com/creativemaybeno)

Plugin that allows you to keep the device screen awake, i.e. prevent the screen from sleeping

---

The plugin allows you to enable and toggle the screen wakelock, which prevents the screen from turning off automatically.  
Essentially, this allows you to keep the device awake, i.e. prevent the device from sleeping.

## Supported platforms

| Platform | `wakelock` support |
| :------- | :----------------: |
| Android  |         ✅         |
| iOS      |         ✅         |
| Web      |         ✅         |
| macOS    |         ✅         |
| Windows  |         ✅         |
| Linux    |      planned       |

## Usage

To use this plugin, follow the [installing guide](https://pub.dev/packages/wakelock/install).

The `wakelock` plugin **does not require any special _permissions_** on any platform :)  
This is because it only enables the _screen wakelock_ and not any partial (CPU) wakelocks that would keep the app alive in the background.

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

For more advanced usage, you can pass a `bool` to [`Wakelock.toggle`](https://pub.dev/documentation/wakelock/latest/wakelock/Wakelock/toggle.html)
to enable or disable the wakelock and also retrieve the current wakelock status using
[`Wakelock.isEnabled`](https://pub.dev/documentation/wakelock/latest/wakelock/Wakelock/isEnabled.html):

```dart
import 'package:wakelock/wakelock.dart';
// ...

// The following lines of code toggle the wakelock based on a bool value.
bool enable = true;
// The following statement enables the wakelock.
Wakelock.toggle(enable: enable);

enable = false;
// The following statement disables the wakelock.
Wakelock.toggle(enable: enable);

// If you want to retrieve the current wakelock status,
// you will have to be in an async scope
// to await the Future returned by `enabled`.
bool wakelockEnabled = await Wakelock.enabled;
```

If you want to wait for the wakelock toggle to complete (which takes an insignificant amount of
time), you can also `await` any of `Wakelock.enable`, `Wakelock.disable`, and `Wakelock.toggle`.

### Ensure the `WidgetsBinding` is initialized

If you want to call `Wakelock.enable()` or the other functions before `runApp()` (e.g. in `main()`),
you will have to ensure that the `WidgetsBinding` is initialized first:

```dart
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Wakelock.enable();

  runApp(..);
}
```

In general, it is advisable to make your wakelock dependent on certain components within your app
instead, e.g. by only enabling it (continually) when a certain widget is visible.
There is no negative impact in calling `Wakelock.enable()` more often.

### Calling `Wakelock.enable()` in `main()`

As touched on in the previous paragraph, calling `Wakelock.enable()` in your `main()` function is
not the best approach for a number of reasons.

The most important factors are:

1. Users expect their screen to automatically turn off unless e.g. a video is playing.  
   It is unlikely that your whole app requires the screen to always stay on.
2. The wakelock can be released by external sources at any time (e.g. by the OS).  
   Only calling `Wakelock.enable()` once will most likely mean that the screen turns off at one
   point or another anyway.

This is why you should instead prefer to enable the wakelock whenever components inside of your app
that require the screen to stay on are active. This can e.g. happen in the `build` method of your
widget.

## Learn more

If you want to learn more about how this plugin works, how to contribute, etc., you can read through
the [main README on GitHub](https://github.com/creativecreatorormaybenot/wakelock).
