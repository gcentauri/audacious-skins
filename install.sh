#!/bin/sh

SCRIPT_DIR=$(readlink -f "$0")
SRC_DIR="${SCRIPT_DIR}/src"

error_exit() {
    echo "$1" >&2
    exit "${2:-1}"
}

if [ "$(id -u)" -ne 0 ]; then
	error_exit "must run script with root privileges"
fi

if ! command -v audacious >/dev/null; then
    error_exit "Audacious is not installed"
fi

if [ ! -d "${SRC_DIR}" ]; then
    error_exit "skins directory does not exist"
fi

DST_DIR="/usr/share/audacious/Skins"

if [ -d "${DST_DIR}" ]; then
    rm -f "${DST_DIR}"
fi

mkdir -p "${DST_DIR}"

cp -f "${SRC_DIR}"/* "${DST_DIR}"

echo "Audacious skins have been successfully installed"