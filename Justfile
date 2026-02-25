set positional-arguments
set shell := ["bash", "-uc"]


_gs_control_version := `'/usr/bin/grep' "Version:" "./dpkg/DEBIAN/control"`
_gs_build_version := replace(_gs_control_version, "Version: ", "")
_gs_build_package := "bwrapsh_" + _gs_build_version + "_all.deb"


default:
        just --list --unsorted

clean:
        '/usr/bin/git' clean -fxd

checks:
        #!/bin/bash
        set -euxo pipefail
        #	#
        declare -a "_la_exec_check"
        #	#
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
        #	#
        "${_la_exec_check[@]}"

checkb:
        #!/bin/bash
        set -euxo pipefail
        #	#
        declare -a "_la_exec_check"
        #	#
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
        #	#
        "${_la_exec_check[@]}"

mkdir:
        #!/bin/bash
        set -euxo pipefail
        #	#
        declare -a "_la_exec_install"
        #	#
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
        #	#
        "${_la_exec_install[@]}"

precopy:
        #!/bin/bash
        set -euxo pipefail
        #	#
        declare -a "_la_exec_install"
        declare -a "_la_exec_fdfind"
        #	#
        #	#
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
        #	#
        "${_la_exec_install[@]}"
        #	#
        #	#
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
        #	#
        "${_la_exec_install[@]}"
        #	#
        #	#
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
        #	#
        "${_la_exec_install[@]}"
        #	#
        #	#
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
        #	#
        "${_la_exec_install[@]}"
        #	#
        #	#
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
        #	#
        "${_la_exec_install[@]}"
        #	#
        #	#
        echo "{{_gs_build_version}}" > "./build/create/info/version"
        #	#
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
        #	#
        "${_la_exec_fdfind[@]}"
        #	#
        #	#
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
        #	#
        "${_la_exec_fdfind[@]}"
        #	#
        #	#
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
        #	#
        "${_la_exec_fdfind[@]}"

postcopy:
        #!/bin/bash
        set -euxo pipefail
        #	#
        declare -a "_la_exec_install"
        #	#
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
        #	#
        "${_la_exec_install[@]}"

shasum:
        #!/bin/bash
        set -euxo pipefail
        #	#
        cd "./dpkg"
        #	#
        declare -a "_la_exec_fdfind"
        #	#
        _la_exec_fdfind=(
                '/usr/bin/fdfind'
                --strip-cwd-prefix
                --type file
                --exclude "./DEBIAN"
                --exec
                '/usr/bin/shasum'
                --algorithm 256
        )
        #	#
        "${_la_exec_fdfind[@]}" > "../build/create/DEBIAN/shasums"

dpkg:
        #!/bin/bash
        set -euxo pipefail
        #	#
        declare -a "_la_exec_dpkg"
        #	#
        _la_exec_dpkg=(
                '/usr/bin/dpkg-deb'
                --root-owner-group
                --build
                "./build/dpkg"
                "./export/{{_gs_build_package}}"
        )
        #	#
        "${_la_exec_dpkg[@]}"
        #	#
        cd "./export"
        #	#
        declare -a "_la_exec_shasum"
        #	#
        _la_exec_shasum=(
                '/usr/bin/shasum'
                --algorithm 512
                "{{_gs_build_package}}"
        )
        #	#
        "${_la_exec_shasum[@]}" > "{{_gs_build_package}}.shasum"

sync:
        #!/bin/bash
        set -euxo pipefail
        #	#
        declare -a "_la_exec_rsync"
        #	#
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
        #	#
        "${_la_exec_rsync[@]}"

build-deb:
        just clean
        just mkdir
        just precopy
        just shasum
        just postcopy
        just checkb
        just dpkg
