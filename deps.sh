install_main() {
    sudo pacman -S --needed \
        git \
        base-devel \
        zsh \
        fzf \
        neovim \
        exa \
        tmux \
        gitui \
        npm \
        rust \
        ruby \
        jq \
        openssh \
        pnpm \
        ripgrep

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

install_go() {
    yay -S \
        libvips \
        go \
        mkcert
}

install_all() {
    install_main
    install_yay
    install_go
}

if [ "$#" -eq 0 ]; then
	echo "First use: chmod +x ${0}"
	echo "Usage: ./deps.sh <install_what>"
else
	echo "Running ${1}"
	time "$1" "$@"
fi
