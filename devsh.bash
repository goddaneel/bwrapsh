#!/bin/bash


## init
# set
set -e


## function
# tool
function _gF_tool_echo () 
{
        echo -e "\n${3}\033[${1:?}${2:?}\033[0m" ;
}
declare -fr "_gF_tool_echo"

# unit
function _gF_unit_checks () 
{
        declare -a "_la_exec_check" ;
        #               #
        _la_exec_check=(
                '/usr/bin/fdfind'
                --hidden
                --type file
                .
                "./dpkg/usr/bin"
                "./dpkg/usr/share/bwrapsh/main/base"
                "./dpkg/usr/share/bwrapsh/main/patch/bash"
                "./dpkg/usr/share/bwrapsh/extra/profile"
                "./example/usr/local/share/bwrapsh/main/init"
                "./example/usr/local/share/bwrapsh/extra/profile"
                "./example/usr/local/share/bwrapsh/extra/execute"
                "./example/usr/local/share/bwrapsh/extra/flatpak/profile"
                --exec
                '/usr/bin/shellcheck'
                --norc
                --color=always
                -a
                -x
                --
        )
        #               #
        "${_la_exec_check[@]}" ;
}
declare -fr "_gF_unit_checks"
#               #
function _gF_unit_checkb () 
{
        declare -a "_la_exec_check" ;
        #               #
        _la_exec_check=(
                '/usr/bin/fdfind'
                --hidden
                --type file
                .
                "./dpkg/usr/bin"
                "./dpkg/usr/share/bwrapsh/main/base"
                "./dpkg/usr/share/bwrapsh/main/patch/bash"
                "./dpkg/usr/share/bwrapsh/extra/profile"
                --exec
                '/usr/bin/shellcheck'
                --norc
                --color=always
                -a
                -x
                --
        )
        #               #
        "${_la_exec_check[@]}" ;
}
declare -fr "_gF_unit_checkb"
#               #
function _gF_unit_mkdir () 
{
        declare -a "_la_exec_install" ;
        #               #
        _la_exec_install=(
                '/usr/bin/install'
                -v
                -d
                -m 0755
                "./build/create/DEBIAN"
                "./build/create/info"
                "./build/dpkg/DEBIAN"
                "./build/dpkg/usr/bin"
                "./build/dpkg/usr/share/bwrapsh/main/base"
                "./build/dpkg/usr/share/bwrapsh/main/info"
                "./build/dpkg/usr/share/bwrapsh/main/patch/bash"
                "./build/dpkg/usr/share/bwrapsh/main/patch/icewm"
                "./build/dpkg/usr/share/bwrapsh/extra/profile"
                "./export"
        )
        #               #
        "${_la_exec_install[@]}" ;
}
declare -fr "_gF_unit_mkdir"
#               #
function _gF_unit_shasum () 
{
        ( cd "./dpkg"
        #               #
        declare -a "_la_exec_fdfind"
        #               #
        _la_exec_fdfind=(
                '/usr/bin/fdfind'
                --strip-cwd-prefix
                --type file
                --exclude "./DEBIAN"
                --exec
                '/usr/bin/shasum'
                --algorithm 256
        )
        #               #
        "${_la_exec_fdfind[@]}" > "../build/create/DEBIAN/shasums"
        #               #
        exit )
}
declare -fr "_gF_unit_shasum"


## variable
# name
declare -g "_gs_control_version"
declare -g "_gs_build_version"
declare -g "_gs_build_package"

# value
declare -g _gs_1_opt="${1:?}"

# command
_gs_control_version="$('/usr/bin/grep' "Version:" "./dpkg/DEBIAN/control")"
_gs_build_version="${_gs_control_version##"Version: "}"
_gs_build_package="bwrapsh_$(_gs_build_version)_all.deb"


## exec
# case
case "${_gs_1_opt}" in
        "clean-all")
                '/usr/bin/git' clean -fxd
                ;;
        "check-all")
                ;;
        "build-deb")
                ;;
        "sync-local")
                ;;
        *)
                '_gF_tool_echo' "ERROR: Unkown Option."
                #       #
                exit "1"
                ;;
esac
