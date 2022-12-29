#!/bin/sh

SRC_DIR="src"

error_exit() {
    echo "$1" >&2
    exit "${2:-1}"
}

if ! command -v audacious >/dev/null; then
    error_exit "Audacious is not installed"
fi

if [ ! -d "${SRC_DIR}" ]; then
    error_exit "skins directory does not exist"
fi

DST_DIR="${HOME}/.local/share/audacious/Skins"

mkdir -p "${DST_DIR}"

cp -f "${SRC_DIR}"/* "${DST_DIR}"

echo "Audacious skins have been successfully installed"
