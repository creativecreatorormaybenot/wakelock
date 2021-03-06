# wakelock_windows

Windows platform implementation of the `wakelock_platform_interface` for the
[wakelock plugin][wakelock GitHub].

## Getting started

If you want to use the wakelock plugin on Windows, see the
[main `wakelock` plugin package][wakelock Pub].

## Implementation

Note that the implementation does not use a `MethodChannel` implementation as it relies on the
[win32 package][win32 Pub].

[wakelock GitHub]: https://github.com/creativecreatorormaybenot/wakelock
[wakelock Pub]: https://pub.dev/packages/wakelock
[win32 Pub]: https://pub.dev/packages/win32
