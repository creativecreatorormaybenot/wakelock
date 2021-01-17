# wakelock_macos [![Pub version](https://img.shields.io/pub/v/wakelock_macos.svg)](https://pub.dev/packages/wakelock_macos) [![GitHub stars](https://img.shields.io/github/stars/creativecreatorormaybenot/wakelock.svg)](https://github.com/creativecreatorormaybenot/wakelock) [![Twitter Follow](https://img.shields.io/twitter/follow/creativemaybeno?label=Follow&style=social)](https://twitter.com/creativemaybeno)

macOS platform implementation of the `wakelock_platform_interface` for the
[wakelock plugin][wakelock GitHub].

## Getting started

If you want to use the wakelock plugin on macOS, see the [main `wakelock` plugin package](https://pub.dev/packages/wakelock).

## Implementation

Note that the implementation currently uses manual `MethodChannel`s instead of the `pigeon` generated
message until https://github.com/flutter/flutter/issues/73738 is properly resolved.

### Testing

Because of the aforementioned limitation, testing for `wakelock_macos` is currently also only conducted
using the integration tests in `wakelock/example`.

[wakelock GitHub]: https://github.com/creativecreatorormaybenot/wakelock
