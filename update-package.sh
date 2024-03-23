#!/bin/bash

# FIXME: tag name should embed wg version + script version

TAG_NAME="$1"
FRAMEWORK_PATH="wg-go.xcframework"
MANIFEST="Package.swift"

zip -yr "build/$FRAMEWORK_PATH.zip" "build/$FRAMEWORK_PATH"
CHECKSUM=`swift package compute-checksum build/$FRAMEWORK_PATH.zip`

sed -E "s@/[0-9\.]+/($FRAMEWORK_PATH.zip)@/$TAG_NAME/\\1@" $MANIFEST | sed -E "s/checksum: \"[0-9a-f]*\"/checksum: \"$CHECKSUM\"/" >$MANIFEST.tmp
mv $MANIFEST.tmp $MANIFEST
