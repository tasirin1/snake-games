# 🐍 Snake Game — Android APK

Snake game berbasis WebView untuk Android. Responsif, layar sentuh, dan support gamepad.

## Build dengan Android Studio

1. Buka Android Studio
2. Pilih **Open an existing project**
3. Pilih folder `snake-android/`
4. Tunggu Gradle sync selesai
5. Klik **Run** ▶ atau **Build → Build Bundle(s) / APK(s) → Build APK**

## Build dengan Command Line

```bash
# Beri izin gradlew
chmod +x gradlew

# Build debug APK
./gradlew assembleDebug

# APK output: app/build/outputs/apk/debug/app-debug.apk
```

## Build dengan GitHub Actions

Fork/push repo ini ke GitHub, maka Actions akan otomatis build APK.

Atau jalankan workflow manual di tab **Actions → Build APK → Run workflow**.

## Persyaratan

- Android Studio (Chipmunk 2022.2.1+) atau
- JDK 17+ dan Android SDK 34+
- Gradle 8.5 (wrapper sudah termasuk)

## Struktur

```
snake-android/
├── app/
│   ├── src/main/
│   │   ├── java/com/snakegame/MainActivity.kt  — WebView wrapper
│   │   ├── assets/index.html                    — Game HTML
│   │   ├── res/                                 — Layout, tema, icon
│   │   └── AndroidManifest.xml                  — Manifest
│   └── build.gradle
├── build.gradle
├── settings.gradle
└── .github/workflows/build-apk.yml              — CI build
```
