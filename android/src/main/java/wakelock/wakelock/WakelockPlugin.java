package wakelock.wakelock;

import android.view.WindowManager;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

public class WakelockPlugin implements MethodCallHandler {
  private Registrar registrar;

  private WakelockPlugin(Registrar registrar) {
    this.registrar = registrar;
  }

  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "wakelock");
    channel.setMethodCallHandler(new WakelockPlugin(registrar));
  }

  private boolean isWakelockEnabled() {
    return (registrar.activity().getWindow().getAttributes().flags &
            WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON) != 0;
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("toggleWakelock")) {
      final boolean enable = call.argument("enable"), enabled = isWakelockEnabled();
      if (enable) {
        if (!enabled)
          registrar.activity().getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
      } else if (enabled) {
        registrar.activity().getWindow().clearFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
      }
      result.success(null);
    } else if (call.method.equals("isWakelockEnabled")) {
      result.success(isWakelockEnabled());
    } else {
      result.notImplemented();
    }
  }
}
