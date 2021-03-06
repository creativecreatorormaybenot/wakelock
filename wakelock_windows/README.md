# wakelock_windows

Windows platform implementation of the `wakelock_platform_interface` for the
[wakelock plugin][wakelock GitHub].

## Getting started

If you want to use the wakelock plugin on Windows, see the [main `wakelock` plugin package](https://pub.dev/packages/wakelock).

## Implementation

Note that the implementation does not use a `MethodChannel` implementation as relies on the win32 package.
