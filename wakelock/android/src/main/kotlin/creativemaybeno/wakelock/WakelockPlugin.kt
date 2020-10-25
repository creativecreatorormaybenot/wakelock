package creativemaybeno.wakelock

import androidx.annotation.NonNull
import creativemaybeno.wakelock.Messages.IsEnabledMessage
import creativemaybeno.wakelock.Messages.ToggleMessage
import creativemaybeno.wakelock.Messages.WakelockApi
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

/** WakelockPlugin */
class WakelockPlugin : FlutterPlugin, WakelockApi, ActivityAware {
  private var wakelock: Wakelock? = null

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    WakelockApi.setup(flutterPluginBinding.binaryMessenger, this)
    wakelock = Wakelock()
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    WakelockApi.setup(binding.binaryMessenger, null)
    wakelock = null
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    wakelock?.activity = binding.activity
  }

  override fun onDetachedFromActivity() {
    wakelock?.activity = null
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    onAttachedToActivity(binding)
  }

  override fun onDetachedFromActivityForConfigChanges() {
    onDetachedFromActivity()
  }

  override fun toggle(arg: ToggleMessage?) {
    wakelock!!.toggle(arg!!)
  }

  override fun isEnabled(): IsEnabledMessage {
    return wakelock!!.isEnabled()
  }
}
