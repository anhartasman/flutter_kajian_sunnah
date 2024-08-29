#!/bin/bash
pushd android
# flutter build generates files in android/ for building the app
flutter build apk
./gradlew app:assembleAndroidTest
./gradlew app:connectedAndroidTest -Ptarget=/Users/anhartasman/Documents/proyekAndroid/flutter_kajian_sunnah/test_driver/app.dart
popd
