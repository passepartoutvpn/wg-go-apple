#!/bin/bash
WG_VERSION="$1"
FW_PATH="$2"
./build-platforms.sh "$FW_PATH"
./create-framework.sh "$FW_PATH"
