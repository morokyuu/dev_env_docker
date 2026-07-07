#!/usr/bin/env bash

set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOME_DIR="${HOME}"

link() {
    local src="$1"
    local dst="$2"

    if [[ ! -e "${src}" ]]; then
        echo "source not found: ${src}"
        exit 1
    fi

    mkdir -p "$(dirname "${dst}")"

    if [[ -L "${dst}" ]]; then
        echo "link exists: ${dst}"
    elif [[ -e "${dst}" ]]; then
        echo -e "\e[43m --backup existing--:\e[0m ${dst}"
        mv "${dst}" "${dst}.bak"
        ln -s "${src}" "${dst}"
    else
        ln -s "${src}" "${dst}"
    fi

    echo "${dst} -> ${src}"
}

echo "Setting up dotfiles..."

# config系
link \
    "${DOTFILES}/config/nvim" \
    "${HOME_DIR}/.config/nvim"

link \
    "${DOTFILES}/config/tmux" \
    "${HOME_DIR}/.config/tmux"

link \
    "${DOTFILES}/config/zsh" \
    "${HOME_DIR}/.config/zsh"

# home直下系
link \
    "${DOTFILES}/home/.zshrc" \
    "${HOME_DIR}/.zshrc"

link \
    "${DOTFILES}/home/.gitconfig" \
    "${HOME_DIR}/.gitconfig"

#link \
#    "${DOTFILES}/home/.profile" \
#    "${HOME_DIR}/.profile"

echo "Done."
