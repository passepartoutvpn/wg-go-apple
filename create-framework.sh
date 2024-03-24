#!/bin/bash
PLATFORMS_PATH="build"
FRAMEWORK_PATH="wg-go.xcframework"

PLATFORMS=("iphoneos" "iphonesimulator" "macosx" "appletvos" "appletvsimulator")
for ARG in ${PLATFORMS[@]}; do
    ARGS+="-library $PLATFORMS_PATH/$ARG/libwg-go.a "
    ARGS+="-headers $PLATFORMS_PATH/$ARG/Headers "
done

rm -rf "$FRAMEWORK_PATH"
xcodebuild -create-xcframework $ARGS -output "$FRAMEWORK_PATH"
