#!/usr/bin/env bash

install_main() {
    sudo pacman -S --needed \
        git \
        base-devel \
        fzf \
        neovim \
        eza \
        tmux \
        npm \
        rust \
        ruby \
        jq \
        openssh \
        pnpm \
        ripgrep \
        less \
        jq \
        lsof \
        chafa
}

install_zsh() {
    yay -Sy \
        zsh \
        zsh-history-substring-search \
        zsh-autosuggestions \
        zsh-pure-prompt \
        tmux-plugin-manager

    echo "to setup zsh as default shell. Run: chsh -s /usr/bin/zsh"
}

install_yay() {
    if [ -d "$HOME/yay/" ]; then
        echo "yay already cloned. Skipping..."
        exit
    fi
    cd "$HOME"
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
}

install_git() {
    yay -Sy lazygit \
        git-standup
}

install_dev() {
    yay -Sy zoxide
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

install_go() {
    yay -Sy \
        go \
        mkcert \
        nginx \
        librsvg \
        graphviz \
        prometheus \
        grafana

    go install github.com/go-delve/delve/cmd/dlv@latest
}

install_py() {
    yay -Sy \
        poetry \
        python-poetry-plugin-shell \
        ruff
}

install_sql() {
    yay -Sy \
        wget \
        unzip \
        libarchive \
        postgresql

    if [ ! -d "$HOME/sqlcheck/" ]; then
        mkdir -p "$HOME/sqlcheck"
        cd "$HOME/sqlcheck"
        wget https://github.com/jarulraj/sqlcheck/releases/download/v1.3/sqlcheck-x86_64.zip
        unzip sqlcheck-x86_64.zip
    fi
}

install_gamedev() {
    echo "For ebitengine..."
    yay -Sy \
        alsa-lib \
        libx11 \
        xorg-xrandr \
        xorg-xinput \
        libxcursor \
        libxinerama
}

install_all() {
    install_main
    install_yay
    install_git
    install_go
    install_py
    install_sql
    install_gamedev
    install_dev
    install_zsh
}

if [ "$#" -eq 0 ]; then
    echo "First use: chmod +x ${0}"
    echo "Usage: ./deps.sh <install_what>"
else
    echo "Running ${1}"
    time "$1" "$@"
fi
