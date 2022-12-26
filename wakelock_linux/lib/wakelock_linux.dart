import 'dart:async';

import 'package:dbus/dbus.dart';
import 'package:meta/meta.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:wakelock_platform_interface/wakelock_platform_interface.dart';

/// The Linux implementation of the [WakelockPlatformInterface].
///
/// This class implements the `wakelock` plugin functionality for Linux using
/// the `org.freedesktop.ScreenSaver` D-Bus API (see https://specifications.freedesktop.org/idle-inhibit-spec/latest/re01.html).
class WakelockLinux extends WakelockPlatformInterface {
  /// Registers this class as the default instance of [WakelockPlatformInterface].
  static void registerWith() {
    WakelockPlatformInterface.instance = WakelockLinux();
  }

  /// Constructs an instance of [WakelockLinux].
  WakelockLinux({@visibleForTesting DBusRemoteObject? object})
      : _object = object ?? _createRemoteObject();

  final DBusRemoteObject _object;
  int? _cookie;

  static DBusRemoteObject _createRemoteObject() {
    return DBusRemoteObject(
      DBusClient.session(),
      name: 'org.freedesktop.ScreenSaver',
      path: DBusObjectPath('/org/freedesktop/ScreenSaver'),
    );
  }

  Future<String> get _appName =>
      PackageInfo.fromPlatform().then((info) => info.appName);

  @override
  Future<void> toggle({required bool enable}) async {
    if (enable) {
      _cookie = await _object
          .callMethod(
            'org.freedesktop.ScreenSaver',
            'Inhibit',
            [DBusString(await _appName), const DBusString('wakelock')],
            replySignature: DBusSignature.uint32,
          )
          .then((response) => response.returnValues.single.asUint32());
    } else if (_cookie != null) {
      await _object.callMethod(
        'org.freedesktop.ScreenSaver',
        'UnInhibit',
        [DBusUint32(_cookie!)],
        replySignature: DBusSignature.empty,
      );
      _cookie = null;
    }
  }

  @override
  Future<bool> get enabled async => _cookie != null;
}
