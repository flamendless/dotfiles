if [ -f ~/._aliases ]; then
    . ~/._aliases
fi
if [ -f ~/._functions ]; then
    . ~/._functions
fi

source ~/.bash/mysql-colorize/mysql-colorize.bash
source ~/.bash/git-completion.bash
source ~/.bash/git-prompt.sh
source /usr/share/doc/pkgfile/command-not-found.bash
source /usr/share/bash-completion/bash_completion

function nonzero_return() {
	RETVAL=$?
	[ $RETVAL -ne 0 ] && echo "$RETVAL"
}

export GIT_PS1_SHOWDIRTYSTATE=1
export PS1="\[\e[31m\]\s\[\e[m\]:\[\e[36m\]\u\[\e[m\]@\[\e[33m\]\h\[\e[m\]  \w \[\e[32m\] [\$(git symbolic-ref --short HEAD 2>/dev/null)]\\[\e[m\] \[\e[31m\]*\[\e[m\]\[\e[31m\]\`nonzero_return\`\[\e[m\] \n\[$(tput sgr0)\]\$ "

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
export HISTCONTROL="ignoredups:ignorespace"
shopt -s autocd
set -o noclobber

export PATH="$PATH:${HOME}/Aseprite"

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
