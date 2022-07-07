## 0.6.2

* Fixed Android build issues.

## 0.6.1+2

* Documented the recommendation of not calling `Wakelock.enable()` directly inside of `main()`.

## 0.6.1+1

* Documented necessity of ensuring that the `WidgetsBinding` is initialized.

## 0.6.1

* Fixed infinite loop on iOS.

## 0.6.0+1

* Remove Podfiles from example directory.

## 0.6.0

* Upgraded Android embedding.

## 0.5.6

* Fixed platform interface incompatibility by bumping the version constraint.

## 0.5.5

* Fixed iOS API by updating the method signatures to match the newly generated protocol.

## 0.5.4

* Upgraded `pigeon` and lints.

## 0.5.3+3

* Updated GitHub references to use `main` instead of `master`.

## 0.5.3+2

* Removed empty constructor in Android code.

## 0.5.3+1

* Addded mavenCentral to Gradle build.

## 0.5.3

* Removed Jcenter from Gradle build as has been sunset.

## 0.5.2

* Updated generated message handling.
* Updated generated messages in the platform interface, which fixed calling `setMockMessageHandler`.
* Updated `wakelock_` dependencies with updated Dart SDK constraints (`>=2.12.0`).

## 0.5.1+1

* Added Podspec to the `wakelock` package to avoid build issues on macOS.

## 0.5.1

* Resolved a crash on iOS which was caused by 2 observers on idleTimerDisabled.

## 0.5.0+2

* Fixed example app builds on macOS.

## 0.5.0+1

* Fixed broken web builds due to FFI imports.

## 0.5.0

* Added Windows support 🚀

## 0.4.0

* Bumped to stable null safety release.

## 0.4.0-nullsafety.0

* Added macOS support 🚀

## 0.3.0-nullsafety.3

* Add supported platforms to README.

## 0.3.0-nullsafety.2

* Indicated that no permissions are required for using the `wakelock` plugin in the README.

## 0.3.0-nullsafety.1

* Fixed `UIImagePickerController` disabling the wakelock (using the camera on iOS).

## 0.3.0-nullsafety.0

* Migrated to null safety.
* **Breaking**: removed deprecated `isEnabled` and `on` in `toggle`.

## 0.2.1+1

* Fixed Android build warning (`import_js_library`) by bumping `wakelock_web`.

## 0.2.1

* Rewrote messages to stay as Java code and use `1.8` JVM target in order to allow interop with
  Kotlin. This **fixes** Android build errors.

## 0.2.0+2

* Bumped pigeon to `0.1.14`.

## 0.2.0+1

* Fixed iOS build issue by bumping the `wakelock_web` dependency.

## 0.2.0

* Added web support.
* Overhauled the plugin with the latest Flutter standards.
* Implemented federated plugin approach, adding `wakelock_platform_interface` and `wakelock_web`
  dependencies.
* Removed support for the Android v1 APIs.
* *Deprecated* `Wakelock.isEnabled` in favor of `Wakelock.enabled`. The fact that it is a getter
  should be enough and remove the need for the "is" context.
* *Deprecated* the `on` parameter in `Wakelock.toggle` in favor of the `enable` parameter, which
  should be a more descriptive name.

## 0.1.4+2

* Fixed Gradle builds missing NonNull annotation.

## 0.1.4+1

* Finished migration to new Flutter plugin embedding.
* Fixed missing activity on Android for apps using the old plugin embedding. 
* Lowered Flutter SDK version constraint to `1.12.0`.

## 0.1.4

* Added assertion for `on` in `Wakelock.toggle` to be non-null and `@required` annotation.
  This is not a breaking change since it was logically required before.
* Switched from Java to Kotlin for the Android implementation.
* Updated plugin files to the latest Flutter standards.
* Updated structure to ignore unnecessary files.
* Added unit testing.
* Improved the integration tests to make use of the example app.
* Updated example app.
* Added GitHub actions and removed Travis CI.
* Made `CHANGELOG.md` formulations more consistent.
* Updated year in `LICENSE`.
* Enforced `pedantic` lint rules.

## 0.1.3+4

* Fixed iOS simulator issue.

## 0.1.3+3

* Fixed Flutter SDK version constraint.

## 0.1.3+2

* Fixed `pubspec.yaml`.

## 0.1.3+1

* Updated `pubspec.yaml` to match new format.

## 0.1.3

* Completed AndroidX migration.

## 0.1.2+8

* Updated documentation.

## 0.1.2+7

* Formatted `AndroidManifest.xml`.

## 0.1.2+6

* Cleaned up the Android manifest.
* Changed a test name in `test_driver`.
* Updated the plugin description.
* Updated `README.md`.
* Updated `CONTRIBUTING.md`.
* Updated `.travis.yml`.
* Removed unnecessary `Assets` directory from the `ios` folder.

## 0.1.2+5

* Expanded continuous integration to include format checking and code analysis.

## 0.1.2+4

* Updated the example's README.

## 0.1.2+3

* Improved Travis CI setup.
* Updated badges.

## 0.1.2+2

* Updated description.
* Flutter master is used in integration tests now.

## 0.1.2+1

* Added integration testing.
* Removed unnecessary Android Manifest permission.
* Added a contributing guide.
* Added CI.

## 0.1.2

* Changed `Wakelock.toggle`'s parameter to a named parameter.
* Improved iOS implementation.

## 0.1.1+2

* Made the plugin description more concise.

## 0.1.1+1

* Elaborated a bit more in description.

## 0.1.1

* Renamed functions.
* Improved README.

## 0.1.0+3

* Added wakelock permission in Android Manifest.

## 0.1.0+2

* Improved README.
* Removed unnecessary files.

## 0.1.0+1

* Fixed dependency issue.
* Removed unnecessary dependencies.

## 0.1.0

* Bumped version to indicate that the plugin is fully usable.
* Improved README's.
* Formatted Dart files.

## 0.0.1

* Initial version.
