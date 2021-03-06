# wakelock_windows

A new Flutter package project.

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

# wakelock_windows

Windows platform implementation of the `wakelock_platform_interface` for the
[wakelock plugin][wakelock GitHub].

## Getting started

If you want to use the wakelock plugin on Windows, see the [main `wakelock` plugin package](https://pub.dev/packages/wakelock).

## Implementation

Note that the implementation does not use a `MethodChannel` implementation as relies on the win32 package.
