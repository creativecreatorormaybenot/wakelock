// Autogenerated from Pigeon (v0.2.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon

package creativemaybeno.wakelock;

import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.StandardMessageCodec;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

/** Generated class from Pigeon. */
@SuppressWarnings({"unused", "unchecked", "CodeBlock2Expr", "RedundantSuppression"})
public class Messages {

  /** Generated class from Pigeon that represents data sent in messages. */
  public static class ToggleMessage {
    private Boolean enable;
    public Boolean getEnable() { return enable; }
    public void setEnable(Boolean setterArg) { this.enable = setterArg; }

    Map<String, Object> toMap() {
      Map<String, Object> toMapResult = new HashMap<>();
      toMapResult.put("enable", enable);
      return toMapResult;
    }
    static ToggleMessage fromMap(Map<String, Object> map) {
      ToggleMessage fromMapResult = new ToggleMessage();
      Object enable = map.get("enable");
      fromMapResult.enable = (Boolean)enable;
      return fromMapResult;
    }
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static class IsEnabledMessage {
    private Boolean enabled;
    public Boolean getEnabled() { return enabled; }
    public void setEnabled(Boolean setterArg) { this.enabled = setterArg; }

    Map<String, Object> toMap() {
      Map<String, Object> toMapResult = new HashMap<>();
      toMapResult.put("enabled", enabled);
      return toMapResult;
    }
    static IsEnabledMessage fromMap(Map<String, Object> map) {
      IsEnabledMessage fromMapResult = new IsEnabledMessage();
      Object enabled = map.get("enabled");
      fromMapResult.enabled = (Boolean)enabled;
      return fromMapResult;
    }
  }

  /** Generated interface from Pigeon that represents a handler of messages from Flutter.*/
  public interface WakelockApi {
    void toggle(ToggleMessage arg);
    IsEnabledMessage isEnabled();

    /** Sets up an instance of `WakelockApi` to handle messages through the `binaryMessenger`. */
    static void setup(BinaryMessenger binaryMessenger, WakelockApi api) {
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.WakelockApi.toggle", new StandardMessageCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              @SuppressWarnings("ConstantConditions")
              ToggleMessage input = ToggleMessage.fromMap((Map<String, Object>)message);
              api.toggle(input);
              wrapped.put("result", null);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
            }
            reply.reply(wrapped);
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.WakelockApi.isEnabled", new StandardMessageCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              IsEnabledMessage output = api.isEnabled();
              wrapped.put("result", output.toMap());
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
            }
            reply.reply(wrapped);
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
    }
  }
  private static Map<String, Object> wrapError(Throwable exception) {
    Map<String, Object> errorMap = new HashMap<>();
    errorMap.put("message", exception.toString());
    errorMap.put("code", exception.getClass().getSimpleName());
    errorMap.put("details", null);
    return errorMap;
  }
}
