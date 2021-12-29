#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
#
if [ -f ~/._aliases ]; then
    . ~/._aliases
fi
if [ -f ~/._functions ]; then
    . ~/._functions
fi

export PATH="$PATH:${HOME}/Aseprite"

export EDITOR=vim
export TERMINAL=terminator
export KEYTIMEOUT=1
export CXX=/usr/bin/clang++
export CC=/usr/bin/clang
export QT_QPA_PLATFORMTHEME="qt5ct"
export MYSQL_UNIX_PORT='/opt/lampp/var/mysql/mysql.sock'
export PATH="$PATH:`yarn global bin`"
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"
export CLASSPATH=.:$CLASSPATH
export PATH_TO_FX=/usr/lib/jvm/java-17-openjdk/lib

PATH="/home/brbl/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/brbl/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/brbl/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/brbl/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/brbl/perl5"; export PERL_MM_OPT;

alias luamake=/home/brbl/Softwares/lua-language-server/3rd/luamake/luamake
