#!/bin/bash
pushd android
# flutter build generates files in android/ for building the app
flutter build apk
./gradlew app:assembleAndroidTest
./gradlew app:assembleDebug -Ptarget=/Users/anhartasman/Documents/proyekAndroid/flutter_kajian_sunnah/test_driver/app.dart
popd

gcloud firebase test android run \
  --type instrumentation \
  --app build/app/outputs/apk/debug/app-debug.apk \
  --test build/app/outputs/apk/androidTest/debug/app-debug-androidTest.apk \
  --timeout 2m \
  --device-ids SH-01L,RED8BEL1 \
  --os-version-ids 28,33 \
# gcloud firebase test android models list