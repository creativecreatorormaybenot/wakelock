set -e
cd $1
flutter packages get
flutter format --set-exit-if-changed .
flutter analyze --no-current-package .
cd example
flutter drive --target=test_driver/app.dart
cd -