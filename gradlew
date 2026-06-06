#!/bin/sh
# Wrapper to run gradlew from snake-android subdirectory
cd "$(dirname "$0")/snake-android"
exec ./gradlew "$@"
