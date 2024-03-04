# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/flamendless/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# https://github.com/agnoster/agnoster-zsh-theme
source ~/agnoster-zsh-theme/agnoster.zsh-theme

export VISUAL=nvim
export PATH=~/.local/bin:$PATH
export EDITOR=nvim
export KEYTIMEOUT=1
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
export ANDROID_HOME=/opt/android-sdk
export PATH=$PATH:/opt/android-sdk/cmdline-tools/latest/bin/
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:/opt/android-sdk/build-tools/33.0.1/

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!.git/*" --glob "!migrations" --glob "!tests"'
export RIPGREP_CONFIG_PATH=~/.ripgreprc

if [ -z "$SSH_AUTH_SOCK" ] ; then
	eval `ssh-agent -s`
	ssh-add
	if [ -f ~/pem/parkmate.db-bastion-host-key-pair.pem ]; then
		ssh-add ~/pem/parkmate.db-bastion-host-key-pair.pem
	fi
fi

alias v="nvim"
alias vim="nvim"
alias mv="mv -iv"
alias cp="cp -iv"
alias rm="rm -iv"
alias cls="clear"
alias ls="exa -l --icons"
alias la="exa -la --icons"
alias zshrc="vim /home/flamendless/.zshrc"
alias reload="source ~/.zshrc"
alias grep="noglob grep --color=auto --exclude-dir=(.bzr, CVS,.git,.hg,.svn)"
alias memcheck="ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head"

alias gc="git checkout"
alias gS="git status"
alias gp="git pull"
alias gP="git push"
alias gL="git log --pretty=oneline"

alias gu="gitui"
alias gbs="~/dotfiles/better-git-branch.sh"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"

# bun completions
[ -s "/home/flamendless/.bun/_bun" ] && source "/home/flamendless/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
