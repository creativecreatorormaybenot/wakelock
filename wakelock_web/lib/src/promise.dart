@JS()
library firebase.es6_interop;

import 'package:js/js.dart';
import 'package:wakelock_web/src/func.dart';

/// JavaScript promise typing.
@JS('Promise')
class PromiseJsImpl<T> {
  /// Promise constructor for JS code.
  external PromiseJsImpl(Function resolver);

  /// Attaches callbacks to a JS promise.
  external PromiseJsImpl then([Func1? onResolve, Func1? onReject]);
}
