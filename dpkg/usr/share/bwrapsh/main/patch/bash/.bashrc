#!/bin/bash



### bash
## variable
# environment
export PS1='\000'
export PS1+='\n'
export PS1+='\[\033[41;30m\]'
export PS1+='\040BWRAPSH\040'
export PS1+='\[\033[0m\]'
export PS1+='\[\033[46;37m\]'
export PS1+='\040${_ES_BWRAPSH_NAME}\040'
export PS1+='\[\033[0m\]'
export PS1+='\n'
export PS1+='\[\033[46;30m\]'
export PS1+='\040${?}\040'
export PS1+='\[\033[0m\]'
export PS1+='\[\033[44;30m\]'
export PS1+='\040\w\040'
export PS1+='\[\033[0m\]'
export PS1+='\n'
export PS1+='\[\033[43;30m\]'
export PS1+='\040${SHLVL}\040'
export PS1+='\[\033[0m\]'
export PS1+='\040'



### history
## variable
# environment
export HISTTIMEFORMAT="%F %T %t"



### echo
## command
# short
alias echoe='echo -e'

# print
function _GF_p_echo () 
{
        echo -e "\n${3}\033[${1:?}${2:?}\033[0m" ;
}
declare -fr "_GF_p_echo"
#       #
function _GF_p_title () 
{
        echo -e "\n${2}\033[47;30m${1:?}\033[0m" ;
}
declare -fr "_GF_p_title"



### ls
## command
# short
alias ls,='ls --color'
alias la='ls --color -A'
alias ll='ls --color -lh'
alias lla='ls --color -lhA'



### tree
## command
# short
alias tree,='tree -C'
alias trea='tree -C -a'
alias tres='tree -C -pugshD'
alias tresa='tree -C -pugshDa'



### exa/eza
## command
# short
alias ezaa='eza -a'
alias ezt='eza -T'
alias ezta='eza -Ta'
#       #
function ezl ()
{
        declare -a "_la_exec_eza" ;
        #       #
        _la_exec_eza=(
                eza
                -lgh
                --time-style="long-iso"
                "${@}"
        )
        #       #
        "${_la_exec_eza[@]}" ;
}
declare -fr "ezl"
alias ezla='ezl -a'
alias ezt='ezl -T'
alias ezta='ezl -Ta'
alias ezlag='ezl -a --git --git-repos'
alias eztg='ezl -T --git --git-repos'
alias eztag='ezl -Ta --git --git-repos'



### less
## variable
# environment
export LESS='-R --use-color -Dd+r$Du+b$'



### batcat
## variable
# environment
export BAT_STYLE="header,grid"


## command
# alias
function bat ()
{
        batcat "${@}" ;
}
declare -fr "bat"

# short
alias batf='batcat --style=full'
#       #
function catb ()
{
        declare -a "_la_exec_batcat" ;
        #       #
        _la_exec_batcat=(
                batcat
                --paging="never"
                "${@}"
        )
        #       #
        "${_la_exec_batcat[@]}" ;
}
declare -fr "catb"
#       #
function lessb ()
{
        declare -a "_la_exec_batcat" ;
        #       #
        _la_exec_batcat=(
                batcat
                --paging="always"
                "${@}"
        )
        #       #
        "${_la_exec_batcat[@]}" ;
}
declare -fr "lessb"
#       #
function batl ()
{
        declare -a "_la_exec_batcat" ;
        #       #
        _la_exec_batcat=(
                batcat
                --paging="auto"
                -l
                "${@}"
        )
        #       #
        "${_la_exec_batcat[@]}" ;
}
declare -fr "batl"
alias ,helpb='batl help'
alias ,bashb='batl bash'



### diff
## command
# short
alias diff,='diff --color'
alias diffr='diff --color -r'

# print
function _GF_p_diffb () 
{
        declare -a "_la_exec_batcat" ;
        #       #
        _la_exec_batcat=(
                batcat
                --paging=auto
                -n
                -l "diff"
        )
        #       #
        diff "${@}" | "${_la_exec_batcat[@]}" ;
}
declare -fr "_GF_p_diffb"
alias p,diffb='_GF_p_diffb'
alias p,diffbr='_GF_p_diffb -r'



### grep
## command
# short
alias grep,='grep --color'
alias grepi='grep --color -i'
alias grepe='grep --color -E'
alias grepie='grep --color -iE'



### rg
## command
# short
alias rgi='rg -i'
alias rge='rg -e'
alias rgie='rg -ie'



### fdfind
## command
# alias
alias fdf='fdfind'

# short
alias fdfh='fdfind -H'



### man
## command
# short
function _GF__manb () 
{
        declare -a "_la_exec_batcat" ;
        #       #
        _la_exec_batcat=(
                batcat
                --paging=auto
                -l "man"
        )
        #       #
        man "${@}" | "${_la_exec_batcat[@]}" ;
}
declare -fr "_GF__manb"
alias ,manb='_GF__manb'
#       #
function _GF__manv () 
{
        declare -a "_la_exec_nvim" ;
        #       #
        _la_exec_nvim=(
                nvim
                -RMn
                -c ":set filetype=man"
        )
        #       #
        man "${@}" | "${_la_exec_nvim[@]}" ;
}
declare -fr "_GF__manv"
alias ,manv='_GF__manv'

