# wakelock_web [![Pub version](https://img.shields.io/pub/v/wakelock_web.svg)](https://pub.dev/packages/wakelock_web) [![GitHub stars](https://img.shields.io/github/stars/creativecreatorormaybenot/wakelock.svg)](https://github.com/creativecreatorormaybenot/wakelock) [![Twitter Follow](https://img.shields.io/twitter/follow/creativemaybeno?label=Follow&style=social)](https://twitter.com/creativemaybeno)

Web platform implementation of the `wakelock_platform_interface` for the 
[wakelock plugin][wakelock GitHub].

## Getting started

If you want to use the wakelock plugin on web, see the [main `wakelock` plugin package](https://pub.dev/packages/wakelock).

## Implementation

The web implementation is based on [`NoSleep.js`](https://github.com/richtr/NoSleep.js/), i.e.
the `assets` include a version that was modified to work with the wakelock plugin.  
This supports the [Screen Wake Lock API](https://developer.mozilla.org/en-US/docs/Web/API/Screen_Wake_Lock_API)
if available.

[wakelock GitHub]: https://github.com/creativecreatorormaybenot/wakelock
