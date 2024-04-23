import {
  AbilityAware,
  AbilityPluginBinding,
  FlutterPlugin,
  FlutterPluginBinding,
} from '@ohos/flutter_ohos';
import { IsEnabledMessage, ToggleMessage, WakelockApi } from './WakelockApi';
import window from '@ohos.window';
import { Context } from '@ohos.abilityAccessCtrl';
import runningLock from '@ohos.runningLock';

/** WakelockPlugin **/
export default class WakelockPlugin extends WakelockApi implements FlutterPlugin, AbilityAware {
  private context: Context | null = null;
  private lock: runningLock.RunningLock | null = null;

  constructor() {
    super();
  }

  onAttachedToAbility(binding: AbilityPluginBinding): void {
    this.context = binding.getAbility().context;
  }

  onDetachedFromAbility(): void {
    this.lock?.unhold();
    this.lock = null;
    this.context = null;
  }


  async toggle(msg: ToggleMessage): Promise<void> {

    try {

      if (this.context != null) {
        let windowClass = await window.getLastWindow(this.context);
        await windowClass.setWindowKeepScreenOn(msg.getEnable());
      }

      // let isSupported = runningLock.isSupported(runningLock.RunningLockType.BACKGROUND);
      // if (!isSupported) {
      //   return;
      // }
      // this.lock?.unhold();
      // this.lock = null;
      //
      // if (msg.getEnable()) {
      //   this.lock = await runningLock.create('wakelock', runningLock.RunningLockType.BACKGROUND);
      //   this.lock?.hold(1000);
      // }
    }
    catch (err) {
      console.error('toggle failed, err: ' + err);
    }
  }

  async isEnabled(): Promise<IsEnabledMessage> {
    let isEnabled = false;
    try {
      if (this.context != null) {
        let windowClass = await window.getLastWindow(this.context);
        isEnabled = isEnabled || await windowClass.getWindowProperties().isKeepScreenOn;
      }
      // isEnabled = isEnabled || (this.lock?.isHolding() ?? false);
    }
    catch (err) {
      console.error('toggle failed, err: ' + err);
    }

    return new IsEnabledMessage(isEnabled);
  }

  getUniqueClassName(): string {
    return "WakelockPlugin"
  }

  onAttachedToEngine(binding: FlutterPluginBinding): void {
    WakelockApi.setup(binding.getBinaryMessenger(), this);
  }

  onDetachedFromEngine(binding: FlutterPluginBinding): void {
    WakelockApi.setup(binding.getBinaryMessenger(), null);
  }
}