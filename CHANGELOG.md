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
