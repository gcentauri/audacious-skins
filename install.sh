#!/bin/sh

if [ "$(id -u)" -ne 0 ]; then
	echo "must run script with root privileges"
	exit 1
fi

if ! command -v audacious >/dev/null; then
    echo "Audacious is not installed"
    exit 1
fi

SCRIPT_DIR=$(readlink -f "$0")
SRC_DIR="${SCRIPT_DIR}/src"

if [ ! -d "${SRC_DIR}" ]; then
    echo "skins source directory does not exist"
    exit 1
fi

DST_DIR="/usr/share/audacious/Skins"

if [ -d "${DST_DIR}" ]; then
    rm -f "${DST_DIR}"
fi

mkdir -p "${DST_DIR}"

cp -f "${SRC_DIR}"/* "${DST_DIR}"

echo "Audacious skins have been successfully installed"