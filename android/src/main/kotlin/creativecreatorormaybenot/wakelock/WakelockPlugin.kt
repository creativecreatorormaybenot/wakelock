package creativecreatorormaybenot.wakelock

import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

public class WakelockPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
  private lateinit var channel: MethodChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "wakelock")
    channel.setMethodCallHandler(this)
    wakelock = Wakelock()
  }

  private var registrar: Registrar? = null

  // This static function is optional and equivalent to onAttachedToEngine. It supports the old
  // pre-Flutter-1.12 Android projects. You are encouraged to continue supporting
  // plugin registration via this function while apps migrate to use the new Android APIs
  // post-flutter-1.12 via https://flutter.dev/go/android-project-migration.
  //
  // It is encouraged to share logic between onAttachedToEngine and registerWith to keep
  // them functionally equivalent. Only one of onAttachedToEngine or registerWith will be called
  // depending on the user's project. onAttachedToEngine or registerWith must both be defined
  // in the same class.
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "wakelock")
      val plugin = WakelockPlugin()
      plugin.registrar = registrar
      plugin.wakelock = Wakelock()
      channel.setMethodCallHandler(plugin)
    }
  }

  private var wakelock: Wakelock? = null

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (registrar != null) wakelock!!.activity = registrar!!.activity()
    when (call.method) {
      "toggle" -> {
        wakelock!!.toggle(call.argument<Boolean>("enable")!!, result)
      }
      "isEnabled" -> {
        wakelock!!.isEnabled(result)
      }
      else -> {
        result.notImplemented()
      }
    }
    if (registrar != null) wakelock!!.activity = null
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
    wakelock = null
    registrar = null
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
}
