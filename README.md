# Wakelock [![GitHub stars](https://img.shields.io/github/stars/creativecreatorormaybenot/wakelock.svg)](https://github.com/creativecreatorormaybenot/wakelock) [![Pub version](https://img.shields.io/pub/v/wakelock.svg)](https://pub.dev/packages/wakelock) [![Twitter Follow](https://img.shields.io/twitter/follow/creativemaybeno?label=Follow&style=social)](https://twitter.com/creativemaybeno)

Wakelock is Flutter plugin that allows you to keep the device screen awake, i.e. prevent the screen
from sleeping.

## Supported platforms

| Platform | `wakelock` support |
| :------- | :----------------: |
| Android  |         ✅         |
| iOS      |         ✅         |
| Web      |         ✅         |
| macOS    |         ✅         |
| Windows  |         ✅         |
| Linux    |      planned       |

## Getting started

To learn more about the plugin and getting started, you can view [the main package (`wakelock`) README](https://github.com/creativecreatorormaybenot/wakelock/blob/main/wakelock/README.md).

### Plugin structure

The `wakelock` plugin uses the [federated plugins approach](https://flutter.dev/docs/development/packages-and-plugins/developing-packages#federated-plugins).  
For this plugin, it means that the basic API is defined using [`pigeon`](https://pub.dev/packages/pigeon). The pigeon files can be found in the [`pigeons` directory](https://github.com/creativecreatorormaybenot/wakelock/tree/main/wakelock/pigeons)
in the main package. The API is defined in Dart in the [`wakelock_platform_interface` package](https://github.com/creativecreatorormaybenot/wakelock/tree/main/wakelock_platform_interface).  
Furthermore, the Android and iOS implementations can be found in the main package, while the web implementation is in the [`wakelock_web` package](https://github.com/creativecreatorormaybenot/wakelock/tree/main/wakelock_platform_interface).

The packages in this repo are the following:

| Package                                                                                                                        | Implementations                                     |
| ------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------- |
| [`wakelock`](https://github.com/creativecreatorormaybenot/wakelock/tree/main/wakelock)                                       | Main plugin package + Android & iOS implementations |
| [`wakelock_macos`](https://github.com/creativecreatorormaybenot/wakelock/tree/main/wakelock_macos)                           | macOS implementation                                |
| [`wakelock_platform_interface`](https://github.com/creativecreatorormaybenot/wakelock/tree/main/wakelock_platform_interface) | Basic API definition & message handling             |
| [`wakelock_web`](https://github.com/creativecreatorormaybenot/wakelock/tree/main/wakelock_web)                               | Web implementation                                  |
| [`wakelock_windows`](https://github.com/creativecreatorormaybenot/wakelock/tree/main/wakelock_windows)                           | Windows implementation                              |

## Contributing

If you want to contribute to this plugin, follow the [contributing guide](https://github.com/creativecreatorormaybenot/wakelock/blob/main/.github/CONTRIBUTING.md).

## Origin

Originally, this plugin was based on [`screen`](https://pub.dev/packages/screen).  
Specifically, the wakelock functionality was extracted into this plugin due to lack of maintenance
by the author of the `screen` plugin.

Today, the `wakelock` plugin has been completely refreshed (using latest Flutter standards and
platform integration) with added support for web, Windows, & macOS.
