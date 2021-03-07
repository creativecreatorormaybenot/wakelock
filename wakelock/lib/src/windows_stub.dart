import 'package:wakelock_platform_interface/wakelock_platform_interface.dart';

/// Stub of the Windows implementation that is required because of https://github.com/creativecreatorormaybenot/wakelock/issues/102.
///
/// This should be removed as soon as https://github.com/flutter/flutter/issues/52267#issuecomment-792302417
/// is available.
class WakelockWindows extends WakelockPlatformInterface {}
