# Flutter Exploration

A collection of Flutter screens for purposes of learning and experimenting with Flutter and various packages.

## Check it out

[https://alienspaces.github.io/flutter-exploration](https://alienspaces.github.io/flutter-exploration)

All examples should work with web support.

* Fork and clone
* `flutter run`
* Explore, change, hot reload, go crazy!

## Flutter Installation

Install Flutter manually by [cloning the git repository](https://flutter.dev/docs/get-started/install/linux) so the Flutter version can be set specifically.

Flutter version set to `beta` channel version `1.25.0-8.1.pre` for [web support](https://flutter.dev/docs/development/platform-integration/web) prior to `null safety`.

```sh
flutter channel beta
```

If you have issues setting the Flutter version navigate to your Flutter git repository and checkout the `1.25.0-8.1.pre` tag.

```sh
# Where you installed Fluuter
cd ~/flutter
# Checkout specific beta version
git checkout 1.25.0-8.1.pre
cd -
flutter pub get
flutter run
```

## Flutter Sources

Examples have been taken and potentially modified from the following sources.

* [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
* [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)
