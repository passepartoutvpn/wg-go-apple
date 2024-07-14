#!/bin/bash
if [[ -z $1 ]]; then
    echo "Provide an output"
    exit 1
fi
PLATFORMS_PATH="build"
FRAMEWORK_PATH="$1"

for ARG in `ls $PLATFORMS_PATH`; do
    ARGS+="-library $PLATFORMS_PATH/$ARG/libwg-go.a "
    ARGS+="-headers $PLATFORMS_PATH/$ARG/Headers "
done

rm -rf "$FRAMEWORK_PATH"
xcodebuild -create-xcframework $ARGS -output "$FRAMEWORK_PATH"
