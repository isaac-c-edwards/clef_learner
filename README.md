# ClefLearner

A Flutter-based music education app that helps users learn to read notes on the alto clef. The app displays a random note on a staff and challenges the user to identify it by selecting the correct letter name (A–G) from a circular button layout.

## Instructions for Build and Use

Steps to build and/or run the software:

1. Ensure Flutter SDK (^3.10.7) is installed and on your PATH.
2. Run `flutter pub get` in the project root to install dependencies.
3. Run `flutter run` to launch the app on a connected device or emulator.

Instructions for using the software:

1. A note on the alto clef staff is displayed at the top of the screen.
2. Tap the letter button (A–G) arranged in a circle that matches the displayed note.
3. If correct, a new note appears automatically after a short delay. If incorrect, you are prompted to try again.

## Development Environment

To recreate the development environment, you need the following software and/or libraries with the specified versions:

* [Flutter SDK](https://flutter.dev) — ^3.10.7 (Dart SDK included)
* [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons) — ^0.13.1
* [flutter_lints](https://pub.dev/packages/flutter_lints) — ^6.0.0
* An IDE such as VS Code or Android Studio with Flutter/Dart plugins

## Useful Websites to Learn More

I found these websites useful in developing this software:

* [Flutter Documentation](https://docs.flutter.dev/)
* [Dart Language Tour](https://dart.dev/language)
* [Flutter Widget Catalog](https://docs.flutter.dev/ui/widgets)

## Future Work

The following items I plan to fix, improve, and/or add to this project in the future:

* [ ] Add treble clef note recognition (asset folder exists but is currently empty)
* [ ] Track and display a score or streak counter
* [ ] Add difficulty levels (e.g., timed mode, sharps/flats, ledger lines)