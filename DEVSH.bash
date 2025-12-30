#!/bin/bash


### init
## set
set -e


### function
## tool
function _gF_tool_echo () 
{
        echo -e "\n${3}\033[${1:?}${2:?}\033[0m" ;
}
declare -fr '_gF_tool_echo'


## unit
function _gF_unit_clean () 
{
        '/usr/bin/git' clean -fxd ;
}
declare -fr '_gF_unit_clean'

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
declare -fr '_gF_unit_checks'

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
declare -fr '_gF_unit_checkb'

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
                "./build/dpkg/usr/share/bwrapsh/main/patch/git"
                "./build/dpkg/usr/share/bwrapsh/main/patch/icewm"
                "./build/dpkg/usr/share/bwrapsh/extra/profile"
                "./export"
        )
        #               #
        "${_la_exec_install[@]}" ;
}
declare -fr '_gF_unit_mkdir'

function _gF_unit_precopy () 
{
        declare -a "_la_exec_install" ;
        declare -a "_la_exec_fdfind" ;
        #               #
        #               #
        _la_exec_install=(
                '/usr/bin/install'
                -v
                -p
                -m 0755
                -t
                "./build/dpkg/usr/bin/"
                --
                "./dpkg/usr/bin/bwrapsh"
        )
        #               #
        "${_la_exec_install[@]}" ;
        #               #
        #               #
        _la_exec_install=(
                '/usr/bin/install'
                -v
                -p
                -m 0644
                -t
                "./build/dpkg/usr/share/bwrapsh/main/base/"
                --
                "./dpkg/usr/share/bwrapsh/main/base/bwrapsh_dbusproxy"
                "./dpkg/usr/share/bwrapsh/main/base/bwrapsh_flatpakx11"
        )
        #               #
        "${_la_exec_install[@]}" ;
        #               #
        #               #
        _la_exec_install=(
                '/usr/bin/install'
                -v
                -p
                -m 0644
                -t
                "./build/dpkg/usr/share/bwrapsh/main/info/"
                --
                "./LICENSE"
        )
        #               #
        "${_la_exec_install[@]}" ;
        #               #
        #               #
        _la_exec_install=(
                '/usr/bin/install'
                -v
                -p
                -m 0644
                -t
                "./build/dpkg/usr/share/bwrapsh/main/patch/bash/"
                --
                "./dpkg/usr/share/bwrapsh/main/patch/bash/.bashrc"
        )
        #               #
        "${_la_exec_install[@]}" ;
        #               #
        #               #
        _la_exec_install=(
                '/usr/bin/install'
                -v
                -p
                -m 0644
                -t
                "./build/dpkg/usr/share/bwrapsh/main/patch/git/"
                --
                "./dpkg/usr/share/bwrapsh/main/patch/git/.gitconfig"
        )
        #               #
        "${_la_exec_install[@]}" ;
        #               #
        #               #
        echo "${_gs_build_version}" > "./build/create/info/version" ;
        #               #
        _la_exec_fdfind=(
                '/usr/bin/fdfind'
                --type file
                .
                "./build/create/info"
                "./dpkg/usr/share/bwrapsh/main/info"
                --exec
                '/usr/bin/install'
                -v
                -p
                -m 0644
                -t
                "./build/dpkg/usr/share/bwrapsh/main/info/"
                --
        )
        #               #
        "${_la_exec_fdfind[@]}" ;
        #               #
        #               #
        _la_exec_fdfind=(
                '/usr/bin/fdfind'
                --type file
                .
                "./dpkg/usr/share/bwrapsh/main/patch/icewm/"
                --exec
                '/usr/bin/install'
                -v
                -p
                -m 0644
                -t
                "./build/dpkg/usr/share/bwrapsh/main/patch/icewm/"
                --
        )
        #               #
        "${_la_exec_fdfind[@]}" ;
        #               #
        #               #
        _la_exec_fdfind=(
                '/usr/bin/fdfind'
                --type file
                .
                "./dpkg/usr/share/bwrapsh/extra/profile/"
                --exec
                '/usr/bin/install'
                -v
                -p
                -m 0644
                -t
                "./build/dpkg/usr/share/bwrapsh/extra/profile/"
                --
        )
        #               #
        "${_la_exec_fdfind[@]}" ;
}
declare -fr '_gF_unit_precopy'

function _gF_unit_postcopy () 
{
        declare -a "_la_exec_install" ;
        #               #
        _la_exec_install=(
                '/usr/bin/install'
                -v
                -p
                -m 0644
                -t
                "./build/dpkg/DEBIAN/"
                --
                "./dpkg/DEBIAN/control"
                "./build/create/DEBIAN/shasums"
        )
        #               #
        "${_la_exec_install[@]}" ;
}
declare -fr '_gF_unit_postcopy'

function _gF_unit_shasum () 
{
        ( cd "./dpkg" ;
        #               #
        declare -a "_la_exec_fdfind" ;
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
        "${_la_exec_fdfind[@]}" > "../build/create/DEBIAN/shasums" ;
        #               #
        exit ) ;
}
declare -fr '_gF_unit_shasum'

function _gF_unit_dpkg () 
{
        declare -a "_la_exec_dpkg" ;
        #               #
        _la_exec_dpkg=(
                '/usr/bin/dpkg-deb'
                --root-owner-group
                --build
                "./build/dpkg"
                "./export/${_gs_build_package}"
        )
        #               #
        "${_la_exec_dpkg[@]}" ;
        #               #
        ( cd "./export" ;
        #               #
        declare -a "_la_exec_shasum" ;
        #               #
        _la_exec_shasum=(
                '/usr/bin/shasum'
                --algorithm 512
                "${_gs_build_package}"
        )
        #               #
        "${_la_exec_shasum[@]}" > "${_gs_build_package}.shasum" ;
        #               #
        exit ) ;
}
declare -fr '_gF_unit_dpkg'

function _gF_unit_sync () 
{
        declare -a "_la_exec_rsync"
        #               #
        _la_exec_rsync=(
                '/usr/bin/rsync'
                --info=progress2
                -R
                -av
                -m
                --safe-links
                --max-size="100M"
                --delete
                "/usr/local/share/bwrapsh"
                "./example/"
        )
        #               #
        "${_la_exec_rsync[@]}" ;
}
declare -fr '_gF_unit_sync'



### variable
## name
declare -g "_gs_control_version"
declare -g "_gs_build_version"
declare -g "_gs_build_package"


## value
declare -g _gs_1_opt="${1}"


## command
_gs_control_version="$('/usr/bin/grep' "Version:" "./dpkg/DEBIAN/control")"
_gs_build_version="${_gs_control_version##"Version: "}"
_gs_build_package="bwrapsh_${_gs_build_version}_all.deb"



### exec
## case
case "${_gs_1_opt}" in
        "clean-all")
                '_gF_unit_clean'
                ;;
        "check-all")
                '_gF_unit_checks'
                ;;
        "build-deb")
                '_gF_unit_clean'
                '_gF_unit_mkdir'
                '_gF_unit_precopy'
                '_gF_unit_shasum'
                '_gF_unit_postcopy'
                '_gF_unit_checkb'
                '_gF_unit_dpkg'
                ;;
        "sync-local")
                '_gF_unit_sync'
                ;;
        *)
                '_gF_tool_echo' "31m" "ERROR: Unkown Option."
                ;;
esac
