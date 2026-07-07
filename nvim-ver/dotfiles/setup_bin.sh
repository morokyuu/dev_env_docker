#!/usr/bin/env bash

set -euo pipefail

URL="https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz"
ARCHIVE="nvim-linux-x86_64.tar.gz"
BINDIR="${ARCHIVE%.tar.gz}"
DEST="/opt/nvim"
LINK="/usr/local/bin/nvim"

# ダウンロード
if [[ ! -s "${ARCHIVE}" ]]; then
    echo "Downloading ${ARCHIVE}..."

    if curl -fL -o "${ARCHIVE}" "${URL}"; then
        echo "Download OK"
    else
        echo "Download failed"
        rm -f "${ARCHIVE}"
        exit 1
    fi
else
    echo "${ARCHIVE} already exists."
fi

# 展開
if [[ ! -x "${BINDIR}/bin/nvim" ]]; then
    echo "Extracting..."

    rm -rf "${BINDIR}"

    if tar -xzf "${ARCHIVE}"; then
        echo "Extract OK"
    else
        echo "Extract failed"
        exit 1
    fi
else
    echo "Already extracted."
fi

# インストール
if [[ ! -x "${DEST}/bin/nvim" ]]; then
    echo "Installing to ${DEST}..."

    sudo install -d "${DEST}"

    if sudo cp -a "${BINDIR}/." "${DEST}/"; then
        echo "Install OK"
    else
        echo "Install failed"
        exit 1
    fi
else
    echo "Already installed."
fi

# シンボリックリンク
echo "Updating symbolic link..."

sudo ln -sfn "${DEST}/bin/nvim" "${LINK}"

echo "Done."

echo "Version:"
"${LINK}" --version | head -n1

rm "${ARCHIVE}"

