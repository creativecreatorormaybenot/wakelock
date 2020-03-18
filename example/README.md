# Example

This is a basic example demonstrating the functionality of the wakelock plugin, including enabling & disabling the wakelock and also retrieving the current wakelock status using a `FutureBuilder`.

If you want to run this example app, you need to run `flutter create .` in the `example` directory (`cd example` from the plugin directory) first. This is also necessary when running the Flutter Driver tests.

See [`example/lib/main.dart`](https://github.com/creativecreatorormaybenot/wakelock/blob/master/example/lib/main.dart).

## Integration testing

For integration testing, this plugin uses [`example/test_driver`](https://github.com/creativecreatorormaybenot/wakelock/tree/master/example/test_driver). The project has a setup for continuous integration, which will run the integration tests to confirm that the plugin is working correctly.  
The status for the latest commit is [![build status](https://travis-ci.com/creativecreatorormaybenot/wakelock.svg?branch=master)](https://travis-ci.com/creativecreatorormaybenot/wakelock).

If you want to run the integration tests yourself, you can run `flutter drive --target=test_driver/app.dart` from the `example` directory.
