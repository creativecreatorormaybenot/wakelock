import 'package:dbus/dbus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:wakelock_linux/wakelock_linux.dart';

void main() {
  test('org.freedesktop.ScreenSaver', () async {
    final mock = MockDBusRemoteObject();
    logInvocations([mock]);

    final wakelock = WakelockLinux(object: mock);
    expect(await wakelock.enabled, isFalse);

    when(mock.callMethod('org.freedesktop.ScreenSaver', 'Inhibit', any,
            replySignature: DBusSignature.uint32))
        .thenAnswer((_) =>
            Future.value(DBusMethodSuccessResponse([const DBusUint32(42)])));

    await wakelock.toggle(enable: true);
    expect(await wakelock.enabled, isTrue);

    verify(mock.callMethod('org.freedesktop.ScreenSaver', 'Inhibit', any,
            replySignature: DBusSignature.uint32))
        .called(1);

    when(mock.callMethod('org.freedesktop.ScreenSaver', 'UnInhibit', any,
            replySignature: DBusSignature.empty))
        .thenAnswer((_) => Future.value(DBusMethodSuccessResponse()));

    await wakelock.toggle(enable: false);
    expect(await wakelock.enabled, isFalse);

    verify(mock.callMethod('org.freedesktop.ScreenSaver', 'UnInhibit', any,
            replySignature: DBusSignature.empty))
        .called(1);
  });
}

class MockDBusRemoteObject extends Mock implements DBusRemoteObject {
  @override
  Future<DBusMethodSuccessResponse> callMethod(
    String? interface,
    String? name,
    Iterable<DBusValue>? values, {
    DBusSignature? replySignature,
    bool? noReplyExpected,
    bool? noAutoStart,
    bool? allowInteractiveAuthorization,
  }) {
    return super.noSuchMethod(
      Invocation.method(#callMethod, [
        interface,
        name,
        values,
      ], {
        #replySignature: replySignature,
        #noReplyExpected: noReplyExpected,
        #noAutoStart: noAutoStart,
        #allowInteractiveAuthorization: allowInteractiveAuthorization,
      }),
      returnValue:
          Future.value(DBusMethodSuccessResponse([const DBusUint32(42)])),
    ) as Future<DBusMethodSuccessResponse>;
  }
}
