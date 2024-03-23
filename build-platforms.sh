#!/bin/bash
WG_GO_PATH="src"
BUILD_PATH="build"
FRAMEWORK_PATH="$BUILD_PATH/wg-go.xcframework"

function make_wg_go() {
    local platform_name="$1"
    local archs="$2"
    local outdir="$BUILD_PATH/$platform_name"

    mkdir -p "$outdir"
    mkdir -p "$outdir/Headers"
    make -C "$WG_GO_PATH" PLATFORM_NAME="$platform_name" ARCHS="$archs"
    cp "$WG_GO_PATH/out/libwg-go.a" "$outdir"
    cp "$WG_GO_PATH/wireguard.h" "$outdir/Headers"
    make -C "$WG_GO_PATH" clean
}

make_wg_go "iphoneos" "arm64"
make_wg_go "iphonesimulator" "arm64 x86_64"
make_wg_go "macosx" "arm64 x86_64"
make_wg_go "appletvos" "arm64"
make_wg_go "appletvsimulator" "arm64 x86_64"
