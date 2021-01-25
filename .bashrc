if [ -f ~/._aliases ]; then
    . ~/._aliases
fi
if [ -f ~/._functions ]; then
    . ~/._functions
fi

source ~/.bash/mysql-colorize/mysql-colorize.bash

function nonzero_return() {
	RETVAL=$?
	[ $RETVAL -ne 0 ] && echo "$RETVAL"
}

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

export PS1="\[\e[31m\]\s\[\e[m\]:\[\e[36m\]\u\[\e[m\]@\[\e[33m\]\h\[\e[m\]  \w \[\e[32m\]\`parse_git_branch\`\[\e[m\] \[\e[31m\]*\[\e[m\]\[\e[31m\]\`nonzero_return\`\[\e[m\] \n\[$(tput sgr0)\]\$ "

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
