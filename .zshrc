# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
HISTORY_IGNORE="(ls|cd|pwd|exit|cd)*"
setopt EXTENDED_HISTORY      # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY    # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY         # Share history between all sessions.
setopt HIST_IGNORE_DUPS      # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS  # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_SPACE     # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS     # Do not write a duplicate event to the history file.
setopt HIST_VERIFY           # Do not execute immediately upon history expansion.
setopt APPEND_HISTORY        # append to history file (Default)
setopt HIST_NO_STORE         # Don't store history commands
setopt HIST_REDUCE_BLANKS    # Remove superfluous blanks from each command line being added to the history.


setopt extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/flamendless/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# https://github.com/zsh-users/zsh-history-substring-search
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# https://github.com/zsh-users/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# https://github.com/sindresorhus/pure
PURE_PROMPT_SYMBOL=::
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure

# PERSONAL
export VISUAL=nvim
export PATH=~/.local/bin:$PATH
export EDITOR=nvim
export KEYTIMEOUT=1

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

alias dsm="git standup"
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

if [ -f ~/omi-parkmate-api/.profile ]; then
	source ~/omi-parkmate-api/.profile
fi

export GEM_HOME="$(gem env user_gemhome)"
export PATH="$PATH:$GEM_HOME/bin"

if [ -f /usr/share/nvm/init-nvm.sh ]; then
	source /usr/share/nvm/init-nvm.sh
fi

# WSL
if [[ $(grep -i Microsoft /proc/version) ]]; then
	# Windows 10 WSL
	# export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0.0
	export DISPLAY=$(ip route list default | awk '{print $3}'):0
	export WEBKIT_DISABLE_COMPOSITING_MODE=1
	# export LIBGL_ALWAYS_INDIRECT=1

	# Windows 11 WSL + WSLG
	# export DISPLAY=:0
	# export LC_ALL=C
fi

source "$HOME/.cargo/env"
source $HOME/.cargo/bin
