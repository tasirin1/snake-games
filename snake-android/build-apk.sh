#!/bin/bash
# Build script untuk Android APK
# Memerlukan: JDK 17+ dan Android SDK

set -e

# Cek Java
if ! command -v java &> /dev/null; then
    echo "Error: Java tidak ditemukan. Install JDK 17+"
    echo "  Ubuntu/Debian: sudo apt install default-jdk"
    echo "  macOS: brew install openjdk@17"
    exit 1
fi

# Cek ANDROID_HOME
if [ -z "$ANDROID_HOME" ]; then
    if [ -d "$HOME/Android/Sdk" ]; then
        export ANDROID_HOME="$HOME/Android/Sdk"
    elif [ -d "/usr/lib/android-sdk" ]; then
        export ANDROID_HOME="/usr/lib/android-sdk"
    else
        echo "Error: ANDROID_HOME tidak diset. Install Android SDK atau set variabel."
        echo "  export ANDROID_HOME=/path/to/android/sdk"
        exit 1
    fi
fi

echo "=== Building Snake Game APK ==="
echo "ANDROID_HOME: $ANDROID_HOME"
echo "Java: $(java -version 2>&1 | head -1)"

# Build
chmod +x gradlew
./gradlew assembleDebug

APK="app/build/outputs/apk/debug/app-debug.apk"
if [ -f "$APK" ]; then
    echo ""
    echo "✅ APK berhasil dibuat!"
    echo "   $APK"
    echo "   Size: $(du -h "$APK" | cut -f1)"
    echo ""
    echo "Install dengan: adb install $APK"
else
    echo "❌ Build gagal!"
    exit 1
fi
