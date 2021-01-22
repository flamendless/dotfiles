source ~/.zsh/antigen.zsh
antigen use oh-my-zsh
antigen theme wdhg/zlambda
antigen bundle michaelxmcbride/zsh-dircycle
antigen bundle peterhurford/up.zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen apply

if [ -f ~/._aliases ]; then
    . ~/._aliases
fi
if [ -f ~/._functions ]; then
    . ~/._functions
fi

setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP

autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors
zmodload zsh/complist
compinit
_comp_options+=(globdots)

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^f' edit-command-line

export PATH="$PATH:${HOME}/Aseprite"
export PATH="$PATH:${HOME}/libs/"
# export PATH=$PATH:/opt/android-sdk/build-tools/28.0.2
export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

export EDITOR=vim
export TERMINAL=termite
export KEYTIMEOUT=1
export CXX=/usr/bin/clang++
export CC=/usr/bin/clang
export QT_QPA_PLATFORMTHEME="qt5ct"
export MYSQL_UNIX_PORT='/opt/lampp/var/mysql/mysql.sock'
export PATH="$PATH:`yarn global bin`"

PATH="/home/brbl/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/brbl/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/brbl/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/brbl/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/brbl/perl5"; export PERL_MM_OPT;
