import StandardMessageCodec from '@ohos/flutter_ohos/src/main/ets/plugin/common/StandardMessageCodec';
import BasicMessageChannel, { Reply } from '@ohos/flutter_ohos/src/main/ets/plugin/common/BasicMessageChannel';
import { BinaryMessenger, TaskQueue } from '@ohos/flutter_ohos/src/main/ets/plugin/common/BinaryMessenger';
import MessageCodec from '@ohos/flutter_ohos/src/main/ets/plugin/common/MessageCodec';
import { ByteBuffer } from '@ohos/flutter_ohos/src/main/ets/util/ByteBuffer';
import { HashMap } from '@kit.ArkTS';


/** Error class for passing custom error details to Flutter via a thrown PlatformException. */
export class FlutterError implements Error {
  /** The error code. */
  public code: string;
  /** The error name. */
  public name: string;
  /** The error message. */
  public message: string;
  /** The error stack. */
  public stack?: string;

  constructor(code: string, name: string, message: string, stack: string) {
    this.code = code;
    this.name = name;
    this.message = message;
    this.stack = stack;
  }
}

function wrapError(error: Error): Array<Object> {
  let errorList: Array<Object> = new Array<Object>(3);
  if (error instanceof FlutterError) {
    let err: FlutterError = error as FlutterError;
    errorList[0] = err.code;
    errorList[1] = err.name;
    errorList[2] = err.message;
  } else {
    errorList[0] = error.toString();
    errorList[1] = error.name;
    errorList[2] = "Cause: " + error.message + ", Stacktrace: " + error.stack;
  }
  return errorList;
}

/*
*  Message for toggling the wakelock on the platform side.
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class ToggleMessage {
  private enable: boolean;

  getEnable(): boolean {
    return this.enable;
  }

  constructor(enable: boolean) {
    this.enable = enable;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    arr.push(this.enable);
    return arr;
  }


  static fromMap(message: Object): ToggleMessage {
    let  pigeonMap:Map<Object, Object> = message as Map<Object, Object>;
    let instance: ToggleMessage = new ToggleMessage(pigeonMap.get('enable') as boolean);
    return instance;
  }
}

/*
*  Message for reporting the wakelock state from the platform side.
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class IsEnabledMessage {
  private enabled: boolean;

  getEnabled(): boolean {
    return this.enabled;
  }

  constructor(enabled: boolean) {
    this.enabled = enabled;
  }

  toMap(): HashMap<string, Object> {
    let toMapResult: HashMap<string, Object> = new HashMap<string, Object>();
    toMapResult.set("enabled", this.enabled);
    return toMapResult;
  }

  static fromList(arr: Object[]): IsEnabledMessage {
    let instance: IsEnabledMessage = new IsEnabledMessage(arr[0] as boolean);
    return instance;
  }
}

class WakelockApiCodec extends StandardMessageCodec {
  static INSTANCE: WakelockApiCodec = new WakelockApiCodec();

  getByte(n: number): number {
    let byteArray = new Uint8Array(1);
    byteArray[0] = n;
    return byteArray[0] as number;
  }

  readValueOfType(type: number, buffer: ByteBuffer): ESObject {
    switch (type) {
      case this.getByte(128):
        return IsEnabledMessage.fromList(super.readValue(buffer));
      case this.getByte(129):
        return ToggleMessage.fromMap(super.readValue(buffer));
      default:
        return super.readValueOfType(type, buffer);
    }
  }

  writeValue(stream: ByteBuffer, value: ESObject): ESObject {
    if (value instanceof IsEnabledMessage) {
      stream.writeInt8(this.getByte(128));
      this.writeValue(stream, (value as IsEnabledMessage).toMap());
    } else if (value instanceof ToggleMessage) {
      stream.writeInt8(this.getByte(129));
      this.writeValue(stream, (value as ToggleMessage).toList());
    } else {
      super.writeValue(stream, value);
    }
  }
}

/* Generated abstract class from Pigeon that represents a handler of messages from Flutter.*/
export abstract class WakelockApi {
  abstract toggle(msg: ToggleMessage): Promise<void>;

  abstract isEnabled(): Promise<IsEnabledMessage>;

  /** The codec used by WakelockApi. */
  static getCodec(): MessageCodec<Object> {
    return WakelockApiCodec.INSTANCE;
  }

  /*Sets up an instance of `WakelockApi` to handle messages through the `binaryMessenger`.*/
  static setup(binaryMessenger: BinaryMessenger, api: WakelockApi | null): void {
    {
      let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel(
          binaryMessenger, "dev.flutter.pigeon.WakelockApi.toggle", WakelockApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
          async onMessage(message: Object, reply: Reply<Object>) {
            let args: Array<Object> = message as Array<Object>;
            let res: Map<string, ESObject> = new Map();
            try {
              await api!.toggle(args[0] as ToggleMessage);
              res.set('result',null);
            }
            catch (error) {
              res.set('error', wrapError(error));
            }
            reply.reply(res);
          }
        });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
        new BasicMessageChannel(
          binaryMessenger, "dev.flutter.pigeon.WakelockApi.isEnabled", WakelockApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
          async onMessage(message: Object, reply: Reply<Object>) {
            let res: Map<string, ESObject> = new Map();
            try {
              let output: IsEnabledMessage = await api!.isEnabled();
              res.set('result',output);
            }
            catch (error) {
              res.set('error', wrapError(error));
            }
            reply.reply(res);
          }
        });
      } else {
        channel.setMessageHandler(null);
      }
    }
  }
}
