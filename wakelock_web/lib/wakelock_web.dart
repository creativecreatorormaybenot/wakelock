import 'dart:async';
import 'dart:js';

import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:import_js_library/import_js_library.dart';

/// A web implementation of the Wakelock plugin.
class WakelockWebPlugin {
  final _isWakelockSupported = context['navigator'].hasProperty('wakeLock');

  static void registerWith(Registrar registrar) {
    final MethodChannel channel = MethodChannel(
      'wakelock',
      const StandardMethodCodec(),
      registrar.messenger,
    );

    /// Import JS libraries
    importJsLibrary(url: './assets/NoSleep.js', flutterPluginName: 'wakelock');

    final pluginInstance = WakelockWebPlugin();
    channel.setMethodCallHandler(pluginInstance.handleMethodCall);
  }

  /// Handles method calls over the MethodChannel of this plugin.
  /// Note: Check the "federated" architecture for a new way of doing this:
  /// https://flutter.dev/go/federated-plugins
  Future<dynamic> handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'toggle':
        final bool enable = call.arguments['enable'];
        return Future.value(_toggle(enable));
        break;
      case 'isEnabled':
        return Future.value(_isEnabled());
        break;
      default:
        throw PlatformException(
          code: 'Unimplemented',
          details: 'wakelock_web for web doesn\'t implement \'${call.method}\'',
        );
    }
  }

  _toggle(bool enable) {
    if (_isWakelockSupported) {
      final method = enable ? 'enable' : 'disable';
      context['Wakelock'].callMethod(method);
    }
  }

  bool _isEnabled() {
    return context['Wakelock'].callMethod('isEnabled');
  }
}
