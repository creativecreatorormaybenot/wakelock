# wakelock_linux [![Pub version](https://img.shields.io/pub/v/wakelock_linux.svg)](https://pub.dev/packages/wakelock_linux) [![GitHub stars](https://img.shields.io/github/stars/creativecreatorormaybenot/wakelock.svg)](https://github.com/creativecreatorormaybenot/wakelock) [![Twitter Follow](https://img.shields.io/twitter/follow/creativemaybeno?label=Follow&style=social)](https://twitter.com/creativemaybeno)

Linux platform implementation of the `wakelock_platform_interface` for the
[wakelock plugin][wakelock GitHub].

## Getting started

If you want to use the wakelock plugin on Linux, see the
[main `wakelock` plugin package][wakelock Pub].

## Implementation

Note that the implementation does not use a `MethodChannel` implementation as it relies on the
[dbus package][dbus Pub].

[wakelock GitHub]: https://github.com/creativecreatorormaybenot/wakelock
[wakelock Pub]: https://pub.dev/packages/wakelock
[dbus Pub]: https://pub.dev/packages/dbus
