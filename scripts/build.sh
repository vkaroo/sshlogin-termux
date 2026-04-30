#!/bin/bash
set -e
cd "$(dirname "$0")/termux-app"
for patch in "$(dirname "$0")/patches/"*.patch; do
    echo "Applying: $(basename $patch)"
    git apply "$patch" || true
done
./gradlew assembleDebug
echo "APK: app/build/outputs/apk/debug/app-debug.apk"
