#vim: fdm=marker tw=79 sw=4 ts=4 ai

# .bashrc

# {{{ bashdb
# set -x
# PS4='(${BASH_SOURCE}:${LINENO}): '
# export PS4="${PS4} ${FUNCNAME[0]} - [${SHLVL},${BASH_SUBSHELL}, $?]"
# }}}

# {{{ Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
# }}}

# {{{ pybugz
if [ -f ~/.pybugzrc ]; then
	. ~/.pybugzrc
fi
# }}}

# {{{ aliases
#
# {{{ clipboard
clippass() {
    #pwgen $@ | tr -d "\n$" | xclip -selection clipboard
    # use xsel as we needed for fpaste anyways
    pwgen ${1:--sy} ${2:-20} 1 | tr -d "\n$" | xsel -ib
}

# copy text or 'cat file' for file contents
clipcp() {
    cat ${1} | xsel -ib
}

# sent text to fedora paste ('cat file' to send contents)
clipfp() {
    cat | fpaste -l ${1:-text} --raw | xsel -ib
}
# clipboard }}}

# {{{ gpg
#
# as of Fedora 22 gpg-agent is provided by gnupg2
alias gpg="/usr/bin/gpg2"
# for terminal only interactive sessions (remote login)
# gpg-agent is started from .bash_profile
# man page says so
export GPG_TTY=$(tty)
# https://gitorious.org/gnupg-org/gnupg/commit/36ba7845995dd3caf8faeec3e09b3ffb879fc29b
unset GPG_AGENT_INFO
unset SSH_AGENT_PID
# man gpg-agent: support for SSH keys
if [[ ${gnupg_SSH_AUTH_SOCK_by:-0} -ne $$ ]]; then
    # read /usr/share/gnupg2/NEWS
    if [[ -d /run/user/${UID}/gnupg ]] ; then
        export SSH_AUTH_SOCK="/run/user/${UID}/gnupg/S.gpg-agent.ssh"
    else
        export SSH_AUTH_SOCK="${HOME}/.gnupg/S.gpg-agent.ssh"
    fi
    # 'man gpg-agent': make sure the passphrase prompt window pops up on this
    # terminal but only if we are in an interactive session
    [[ $- == *i* ]] && gpg-connect-agent updatestartuptty /bye >/dev/null
fi
# }}}

# {{{ ssh agent forwarding
export SSH_AUTH_FILE=${HOME}/.ssh/.agent
if [[ -n ${WINDOW} ]] ; then
    # reset ssh auth for user on SSH_TTY so agent forwarding works with 
    # existing screen session
    # get pts/ based on screen tree
    SESS_TTY="$(tty)"
    SSH_AUTH_FILE_PTS=$(who | fgrep "${SESS_TTY#*/dev/}" \
                        | sed -n 's/.*:pts\/\([0-9]\+\):.*/pts-\1/gp')
    if [[ -n ${SSH_AUTH_FILE_PTS} ]] && [[ -f ${SSH_AUTH_FILE}.${SSH_AUTH_FILE_PTS} ]] ; then
        . ${SSH_AUTH_FILE}.${SSH_AUTH_FILE_PTS}
    fi
else
    # reset ssh auth so agent forwarding works with existing screen session
    # but only if we connect with agent forwarding
    # this one is guaranteed to be unique for each user and session (terminal)
    SSH_AUTH_FILE_PTS=pts-${SSH_TTY##*pts/}
    if [[ -n ${SSH_AUTH_SOCK} ]] ; then
        env | sed -n 's/^SSH_\([A-Z_]\+\)=\(.\+\)/export SSH_\1="\2"/gp' \
            >${SSH_AUTH_FILE}.${SSH_AUTH_FILE_PTS}
    fi
fi
# }}}

# {{{ bc
#hex to dec conversion'
hex2dec() {
    while read -p "hex: " q ; do
        echo "ibase=16; print ${q^^}; print \"\n\"" | bc
    done
}
 #dec to hex conversion
dec2hex() {
    while read -p "dec: " q ; do
        echo "obase=16; print ${q}; print \"\\n\"" | bc
    done
}
# bc }}}

# {{{ xsane pdf size reduction
xsane-pdf() {
    while true ; do
        read -e -p "File name: " q
        pdf2ps ${q} ${q%.pdf}.ps
        ps2pdf ${q%.pdf}.ps ${q}
    done
    unset q
}
# }}}

# {{{ nmap
# 'nc' was good but recent version do not have the '-z' option
#
alias nmap-wan='nmap -n --reason -Pn'
nmap-lan() {
    nmap -n --max-rtt-timeout 100ms --initial-rtt-timeout 100ms \
        --host-timeout 100ms -max-retries 0 --reason -Pn
###alias nmap='nmap -Pn --reason'
}
# }}}

# {{{ record the desktop
record-desktop() {
    recordmydesktop --windowid \
        $(xwininfo | awk '/Window id:/ {print $4}')
}
# }}}

# {{{ git
#
if [ -f /etc/bashrc ]; then
   . ~/.bashrc-git-config
fi
git-prompt() {
    # https://techbase.kde.org/Development/Git/Configuration
    # http://git.kernel.org/cgit/git/git.git/plain/contrib/completion/git-prompt.sh
    export _ps1_before_git_prompt="${PS1}"
    source ~/.git-prompt.sh
    #PS1="$(__git_ps1 "(%s)") $PS1"
    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWUNTRACKEDFILES=1
    GIT_PS1_SHOWUPSTREAM="auto"
    PS1='$(__git_ps1 "(%s)") \w \$ '
}
# git }}}

# aliases }}}

# {{{ environment setup
# 
export HISTSIZE=100000 HISTFILESIZE=1000000 HISTTIMEFORMAT="%F,%T:  "
export BC_ENV_ARGS="-q ${HOME}/.bcrc"
# use vi mode
# set -o vi
#need this for photos
umask 0002
# custom message at login
[[ $- == *i* ]] && cat ~/.login_msg 
# check-todo-issues
export BROWSER=/usr/bin/firefox 
# http://fedoraproject.org/wiki/HOWTO_Setup_Android_Development
export PATH=${HOME}/work/dev/android-sdk-linux:${PATH}
# my scripts
export PATH=${HOME}/bin:${PATH}
PS1="\h \w $ "
# git and vim-vundle like to know the default editor
export EDITOR=/usr/bin/vim
# }}}

# {{{ screen
#
## screen-256color is not supported/known by older-ish systems
[[ "${TERM}" == "screen-256color" ]] && export TERM=screen
[[ "${TERM}" == "xterm-256color" ]] && export TERM=xterm
## dynamically set window title when inside 'screen'
# [[ $TERM == screen* ]] \
#   && PROMPT_COMMAND='printf "\033k%s@%s %s\033\\" "${USER}" \
#       "${HOSTNAME%%.*}" "${PWD##*/}"'
if [[ $TERM == screen* ]] ; then
    export TERM=screen
    PROMPT_COMMAND_ARGS='printf "\033k%s> %s\033\\" '
    PROMPT_COMMAND_VALS='"${USER}" "${PWD##*/}"'
    PROMPT_COMMAND="${PROMPT_COMMAND_ARGS}${PROMPT_COMMAND_VALS}"
fi
# }}}

# {{{ python virtualenv
#
VIRTUAL_ENV_DISABLE_PROMPT=0
# }}}
