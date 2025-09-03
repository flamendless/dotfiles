#!/usr/bin/env bash

install_main() {
    brew install \
        git \
        zsh \
        fzf \
        neovim \
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
        chafa \
        eza \
        bash

    echo "$(brew --prefix)/bin/bash" | sudo tee -a /etc/shells;
}

install_zsh() {
    brew install \
        zsh \
        zsh-history-substring-search \
        zsh-autosuggestions \
        pure \
        tpm

    echo "to setup zsh as default shell. Run: chsh -s /usr/bin/zsh"
}

install_git() {
    brew install lazygit \
        git-standup \
        gh
}

install_dev() {
    brew install zoxide
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

install_go() {
    brew install \
        go \
        mkcert \
        nginx \
        librsvg \
        graphviz

    go install github.com/go-delve/delve/cmd/dlv@latest
}

install_py() {
    brew install \
        poetry \
        ruff \
	pyenv
}

install_sql() {
    brew install \
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

install_all() {
    install_main
    install_git
    install_go
    install_py
    install_sql
    install_dev
    install_zsh
}

if [ "$#" -eq 0 ]; then
    echo "First use: chmod +x ${0}"
    echo "Usage: ./mac_deps.sh <install_what>"
else
    echo "Running ${1}"
    time "$1" "$@"
fi
