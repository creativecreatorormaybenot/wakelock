package creativecreatorormaybenot.wakelock

import android.app.Activity
import android.view.WindowManager
import io.flutter.plugin.common.MethodChannel

internal class Wakelock {
  var activity: Activity? = null

  private val enabled
    get() = activity!!.window.attributes.flags and
        WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON != 0

  fun toggle(enable: Boolean, result: MethodChannel.Result) {
    if (activity == null) {
      result.noActivity()
      return
    }

    val activity = this.activity!!
    val enabled = this.enabled

    if (enable) {
      if (!enabled) activity.window.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
    } else if (enabled) {
      activity.window.clearFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
    }

    result.success(null)
  }

  fun isEnabled(result: MethodChannel.Result) {
    if (activity == null) {
      result.noActivity()
      return
    }

    result.success(enabled)
  }
}

fun MethodChannel.Result.noActivity() = error("no_activity", "wakelock requires a foreground activity", null)
