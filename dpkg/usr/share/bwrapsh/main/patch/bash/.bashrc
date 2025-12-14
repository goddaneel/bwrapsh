#!/bin/bash




#### 1_style
### bash
## variable
# environment
export PS1='\000'
export PS1+='\n'
export PS1+='\[\033[41;37;01m\]'
export PS1+='\040BWRAPSH/${_ES_BWRAPSH_TYPE}\040'
export PS1+='\[\033[0m\]'
export PS1+='\[\033[41;37;03m\]'
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
#       #
export PS0='\000'
export PS0+='\[\033[42;30;05m\]'
export PS0+='\040\t\040'
export PS0+='\[\033[0m\]'
export PS0+='\n'



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
alias ezlt='ezl -T'
alias ezlta='ezl -Ta'
alias ezlg='ezl --git --git-repos'
alias ezlag='ezl -a --git --git-repos'
alias ezltg='ezl -T --git --git-repos'
alias ezltag='ezl -Ta --git --git-repos'



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




#### 1_manage
### bash
## command
# short
alias bashno='bash --noprofile --norc'



### nvim
## variable
# environment
export EDITOR="nvim"


## command
# short
alias nvimc='nvim --clean'
alias nvimr='nvim -RMn'



### htop
## command
# short
function _GF__htopr () 
{
        declare -a "_la_exec_htop" ;
        #       #
        _la_exec_htop=(
                htop
                -M
                -t
                --readonly
                "${@}"
        )
        #       #
        "${_la_exec_htop[@]}" ;
}
declare -fr "_GF__htopr"
alias ,htopr='_GF__htopr'



### rsync
## command
# short
alias rsync,='rsync --info=progress2'
alias rsyncn='rsync --info=progress2 --dry-run'



### shasum
## command
# short
alias shasumc='shasum -c'

# print
function _GF_p_shasumc ()
{
        declare "_ls_1_sums" ;
        declare "_ls_2_file" ;
        #       #
        _ls_1_sums="${1:?}" ;
        _ls_2_file="${2:?}" ;
        #       #
        shift "2" || return ;
        #       #
        echo -e "\n SHASUM: ${_ls_1_sums} \n" ;
        #       #
        shasum -c <(echo "${_ls_1_sums}  ${_ls_2_file}") "${@}" ;
}
declare -fr "_GF_p_shasumc"
alias p,shasumc='_GF_p_shasumc'



### fzf
## command
# environment
function _GF_e_fzfk () 
{
        declare -gx "FZF_ALT_C_OPTS" ;
        #       #
        FZF_ALT_C_OPTS="--preview 'eza -la --no-user --no-time --no-filesize {}'" ;
        #       #
        source "/usr/share/doc/fzf/examples/key-bindings.bash" ;
}
#       #
function _GF_e_fzfc () 
{
        source "/usr/share/doc/fzf/examples/completion.bash" ;
}
#       #
declare -fr "_GF_e_fzfk"
declare -fr "_GF_e_fzfc"
alias e,fzfk='_GF_e_fzfk'
alias e,fzfc='_GF_e_fzfc'
alias e,fzfa='_GF_e_fzfk ; _GF_e_fzfc'
alias e,fzf='_GF_e_fzfk'




#### 2_directory
## command
# short
function _GF__cdp () 
{ 
        cd "${@}" ;
        pwd ;
}
declare -fr "_GF__cdp"
alias ,cdp='_GF__cdp'

# print
function _GF_p_copypath () {
        realpath -e "${1:-"."}" || return ;
        realpath -e "${1:-"."}" | wl-copy -n ;
}
declare -fr "_GF_p_copypath"
alias p,copypath='_GF_p_copypath'



#### 2_display
### wl-clipboard
## command
# alias
alias wlcopy='wl-copy'
alias wlpaste='wl-paste'

# short
alias wlcopyc='wl-copy -c'
alias wlcopyn='wl-copy -n'
alias wlpasten='wl-paste -n'




#### 2_program
### execute
## variable
# environment
export PATH="${PATH}:${HOME}/.local/bin/"




#### 2_proxy
## command
# environment
function _GF_e_proxyv () 
{
        declare "_ls_proxy_full" ;
        declare -gx "ALL_PROXY" ;
        declare -gx "HTTP_PROXY" ;
        declare -gx "HTTPS_PROXY" ;
        declare -gx "all_proxy" ;
        declare -gx "http_proxy" ;
        declare -gx "https_proxy" ;
        #       #
        if [[ "${1}" == ",unset" ]] ; then
                unset -v "ALL_PROXY" ;
                unset -v "HTTP_PROXY" ;
                unset -v "HTTPS_PROXY" ;
                unset -v "all_proxy" ;
                unset -v "http_proxy" ;
                unset -v "https_proxy" ;
        else
                echo "${2:?}" 1>"/dev/null" || return ;
                #       #
                _ls_proxy_full="${1}://127.0.0.1:${2}" ;
                ALL_PROXY="${_ls_proxy_full}" ;
                all_proxy="${_ls_proxy_full}" ;
                HTTP_PROXY="${_ls_proxy_full}" ;
                http_proxy="${_ls_proxy_full}" ;
                HTTPS_PROXY="${_ls_proxy_full}" ;
                https_proxy="${_ls_proxy_full}" ;
        fi
}
declare -fr "_GF_e_proxyv"
alias e,proxyv='_GF_e_proxyv'




#### 3_dpkg
### dpkg
## command
# file # custom
function _GF_fc_dpkge () 
{
        ( 
        #       #
        set -e ;
        #       #
        declare -g "_gs_1_base" ;
        declare -g "_gs_1_ext" ;
        #       #
        _gs_1_base="$(basename "${1:?}")" ;
        _gs_1_ext="${1}_ext" ;
        #       #
        if [[ ! -e "${_gs_1_ext}" ]] ; then
                mkdir -pv "${_gs_1_ext}" ;
                cp -iv "${1}" "${_gs_1_ext}/" ;
        else
                '_GF_p_echo' "33m" "WARNING: The path exists." ;
                exit "1" ;
        fi
        #       #
        cd "${_gs_1_ext}" ;
        pwd ;
        #       #
        dpkg-deb -I "${_gs_1_base}" ;
        dpkg-deb -R "${_gs_1_base}"{,_R} ;
        #       #
        echo ;
        '_GF_p_list' "." -L 3 ;
        #       #
        exit ) ;
}
declare -fr "_GF_fc_dpkge"
alias fc,dpkge='_GF_fc_dpkge'




#### 3_git
## variable
# environment
export GIT_EDITOR="nvim"


## command
# alias
alias gitc='git -P'
alias gitl='git -p'

# short
function _GF__gitcdst () 
{
        cd "${1:-"."}" ;
        pwd ;
        #       #
        if [[ -d "./.git" ]] ; then
                '_GF_p_title' "# git count-objects #" ;
                git count-objects -Hv ;
                #       #
                '_GF_p_title' "# git remote #" ;
                git -P remote -v ;
                #       #
                '_GF_p_title' "# git branch #" ;
                git -P branch -avv ;
                #       #
                '_GF_p_title' "# git status #" ;
                git -P status ;
        fi
}
declare -fr "_GF__gitcdst"
alias ,gitcdst='_GF__gitcdst'

