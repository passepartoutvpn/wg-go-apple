#!/bin/bash
WG_VERSION="$1"
WG_REPO="wireguard-apple"
WG_URL="https://github.com/passepartoutvpn/$WG_REPO"
WG_GO_PACKAGE_PATH="Sources/WireGuardKitGo"
BUILD_PATH="build"
PLATFORM_PATH="platforms"
FRAMEWORK_PATH="$BUILD_PATH/wg-go.xcframework"

function pull_and_enter_build() {
    if [[ ! -d "$BUILD_PATH" ]]; then
        mkdir "$BUILD_PATH"
    fi
    cd "$BUILD_PATH"

    if [[ ! -d "$WG_REPO" ]]; then
        git clone --depth 1 --branch "$WG_VERSION" "$WG_URL"
    else
        cd "$WG_REPO"
        git pull
        cd ..
    fi
}

function make_wg_go() {
    local platform_name="$1"
    local archs="$2"
    local outdir="$PLATFORM_PATH/$platform_name"

    mkdir -p "$outdir"
    mkdir -p "$outdir/Headers"
    make -C "$WG_REPO/$WG_GO_PACKAGE_PATH" PLATFORM_NAME="$platform_name" ARCHS="$archs"
    cp "$WG_REPO/$WG_GO_PACKAGE_PATH/out/libwg-go.a" "$outdir"
    cp "$WG_REPO/$WG_GO_PACKAGE_PATH/wireguard.h" "$outdir/Headers"
    make -C "$WG_REPO/$WG_GO_PACKAGE_PATH" clean
}

pull_and_enter_build
make_wg_go "iphoneos" "arm64"
make_wg_go "iphonesimulator" "arm64 x86_64"
make_wg_go "macosx" "arm64 x86_64"
make_wg_go "appletvos" "arm64"
make_wg_go "appletvsimulator" "arm64 x86_64"
