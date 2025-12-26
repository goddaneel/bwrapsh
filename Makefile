### argument
## pack
_gs_control_version := $(shell '/usr/bin/grep' "Version:" "./dpkg/DEBIAN/control")
_gs_build_version := $(subst Version: ,,$(_gs_control_version))
_gs_build_package := bwrapsh_$(_gs_build_version)_all.deb



### array
## clean
_ga_exec_clean += '/usr/bin/git'
_ga_exec_clean += clean
_ga_exec_clean += -fxd


## check
_ga_exec_checks += '/usr/bin/fdfind'
_ga_exec_checks += --type file
_ga_exec_checks += .
_ga_exec_checks += "./dpkg/usr/bin"
_ga_exec_checks += "./dpkg/usr/share/bwrapsh/main/base"
_ga_exec_checks += "./dpkg/usr/share/bwrapsh/main/patch/bash"
_ga_exec_checks += "./dpkg/usr/share/bwrapsh/extra/profile"
_ga_exec_checks += "./example/usr/local/share/bwrapsh/main/init"
_ga_exec_checks += "./example/usr/local/share/bwrapsh/extra/profile"
_ga_exec_checks += "./example/usr/local/share/bwrapsh/extra/execute"
_ga_exec_checks += "./example/usr/local/share/bwrapsh/extra/flatpak/profile"
_ga_exec_checks += --exec
_ga_exec_checks += '/usr/bin/shellcheck'
_ga_exec_checks += --norc
_ga_exec_checks += --color=always
_ga_exec_checks += -a
_ga_exec_checks += -x
_ga_exec_checks += --

_ga_exec_checkb += '/usr/bin/fdfind'
_ga_exec_checkb += --type file
_ga_exec_checkb += .
_ga_exec_checkb += "./build/dpkg/usr/share/bwrapsh/main/base"
_ga_exec_checkb += "./build/dpkg/usr/share/bwrapsh/extra/profile"
_ga_exec_checkb += "./build/dpkg/usr/share/bwrapsh/extra/execute"
_ga_exec_checkb += "./build/dpkg/usr/share/bwrapsh/extra/flatpak/profile"
_ga_exec_checkb += "./build/dpkg/usr/share/bwrapsh/extra/flatpak/execute"
_ga_exec_checkb += --exec
_ga_exec_checkb += '/usr/bin/shellcheck'
_ga_exec_checkb += --norc
_ga_exec_checkb += --color=always
_ga_exec_checkb += -a
_ga_exec_checkb += -x
_ga_exec_checkb += --


## mkdir
_ga_exec_mkdir += '/usr/bin/install'
_ga_exec_mkdir += -v
_ga_exec_mkdir += -d
_ga_exec_mkdir += -m 0755
_ga_exec_mkdir += "./build/create/DEBIAN"
_ga_exec_mkdir += "./build/create/info"
_ga_exec_mkdir += "./build/dpkg/DEBIAN"
_ga_exec_mkdir += "./build/dpkg/usr/bin"
_ga_exec_mkdir += "./build/dpkg/usr/share/bwrapsh/main/base"
_ga_exec_mkdir += "./build/dpkg/usr/share/bwrapsh/main/info"
_ga_exec_mkdir += "./build/dpkg/usr/share/bwrapsh/main/patch/bash"
_ga_exec_mkdir += "./build/dpkg/usr/share/bwrapsh/main/patch/icewm"
_ga_exec_mkdir += "./build/dpkg/usr/share/bwrapsh/extra/profile"
_ga_exec_mkdir += "./export"


## create
_ga_exec_version += echo
_ga_exec_version += "$(_gs_build_version)"
_ga_exec_version += >
_ga_exec_version += "./build/create/info/version"

_ga_exec_fdfind += cd "./dpkg"
_ga_exec_fdfind += &&
_ga_exec_fdfind += '/usr/bin/fdfind'
_ga_exec_fdfind += --strip-cwd-prefix
_ga_exec_fdfind += --type file
_ga_exec_fdfind += --exclude "./DEBIAN"
_ga_exec_fdfind += --exec
_ga_exec_fdfind += '/usr/bin/shasum'
_ga_exec_fdfind += --algorithm 256
_ga_exec_fdfind += >
_ga_exec_fdfind += "../build/create/DEBIAN/shasums"


## copy
_ga_exec_precopy += '/usr/bin/install'
_ga_exec_precopy += -v
_ga_exec_precopy += -p
_ga_exec_precopy += -m 0755
_ga_exec_precopy += -t
_ga_exec_precopy += "./build/dpkg/usr/bin/"
_ga_exec_precopy += --
_ga_exec_precopy += "./dpkg/usr/bin/bwrapsh"
_ga_exec_precopy += &&

_ga_exec_precopy += '/usr/bin/install'
_ga_exec_precopy += -v
_ga_exec_precopy += -p
_ga_exec_precopy += -m 0644
_ga_exec_precopy += "./dpkg/usr/share/bwrapsh/main/base/bwrapsh_dbusproxy"
_ga_exec_precopy += "./dpkg/usr/share/bwrapsh/main/base/bwrapsh_flatpakx11"
_ga_exec_precopy += -t
_ga_exec_precopy += "./build/dpkg/usr/share/bwrapsh/main/base/"
_ga_exec_precopy += --
_ga_exec_precopy += &&

_ga_exec_precopy += '/usr/bin/install'
_ga_exec_precopy += -v
_ga_exec_precopy += -p
_ga_exec_precopy += -m 0644
_ga_exec_precopy += -t
_ga_exec_precopy += "./build/dpkg/usr/share/bwrapsh/main/info/"
_ga_exec_precopy += --
_ga_exec_precopy += "./LICENSE"
_ga_exec_precopy += &&

_ga_exec_precopy += '/usr/bin/fdfind'
_ga_exec_precopy += --type file
_ga_exec_precopy += .
_ga_exec_precopy += "./build/create/info"
_ga_exec_precopy += "./dpkg/usr/share/bwrapsh/main/info"
_ga_exec_precopy += --exec
_ga_exec_precopy += '/usr/bin/install'
_ga_exec_precopy += -v
_ga_exec_precopy += -p
_ga_exec_precopy += -m 0644
_ga_exec_precopy += -t
_ga_exec_precopy += "./build/dpkg/usr/share/bwrapsh/main/info/"
_ga_exec_precopy += --
_ga_exec_precopy += &&

_ga_exec_precopy += '/usr/bin/install'
_ga_exec_precopy += -v
_ga_exec_precopy += -p
_ga_exec_precopy += -m 0644
_ga_exec_precopy += -t
_ga_exec_precopy += "./build/dpkg/usr/share/bwrapsh/main/patch/bash/"
_ga_exec_precopy += --
_ga_exec_precopy += "./dpkg/usr/share/bwrapsh/main/patch/bash/.bashrc"
_ga_exec_precopy += &&

_ga_exec_precopy += '/usr/bin/fdfind'
_ga_exec_precopy += --type file
_ga_exec_precopy += .
_ga_exec_precopy += "./dpkg/usr/share/bwrapsh/main/patch/icewm/"
_ga_exec_precopy += --exec
_ga_exec_precopy += '/usr/bin/install'
_ga_exec_precopy += -v
_ga_exec_precopy += -p
_ga_exec_precopy += -m 0644
_ga_exec_precopy += -t
_ga_exec_precopy += "./build/dpkg/usr/share/bwrapsh/main/patch/icewm/"
_ga_exec_precopy += --
_ga_exec_precopy += &&

_ga_exec_precopy += '/usr/bin/fdfind'
_ga_exec_precopy += --type file
_ga_exec_precopy += .
_ga_exec_precopy += "./dpkg/usr/share/bwrapsh/extra/profile/"
_ga_exec_precopy += --exec
_ga_exec_precopy += '/usr/bin/install'
_ga_exec_precopy += -v
_ga_exec_precopy += -p
_ga_exec_precopy += -m 0644
_ga_exec_precopy += -t
_ga_exec_precopy += "./build/dpkg/usr/share/bwrapsh/extra/profile/"
_ga_exec_precopy += --

_ga_exec_postcopy += '/usr/bin/install'
_ga_exec_postcopy += -v
_ga_exec_postcopy += -p
_ga_exec_postcopy += -m 0644
_ga_exec_postcopy += -t
_ga_exec_postcopy += "./build/dpkg/DEBIAN/"
_ga_exec_postcopy += --
_ga_exec_postcopy += "./dpkg/DEBIAN/control"
_ga_exec_postcopy += "./build/create/DEBIAN/shasums"


## archive
_ga_exec_dpkg += '/usr/bin/dpkg-deb'
_ga_exec_dpkg += --root-owner-group
_ga_exec_dpkg += --build
_ga_exec_dpkg += "./build/dpkg"
_ga_exec_dpkg += "./export/$(_gs_build_package)"

_ga_exec_shasum += cd "./export"
_ga_exec_shasum += &&
_ga_exec_shasum += '/usr/bin/shasum'
_ga_exec_shasum += --algorithm 512
_ga_exec_shasum += "$(_gs_build_package)"
_ga_exec_shasum += >
_ga_exec_shasum += "$(_gs_build_package).shasum"


## sync
_ga_exec_rsync += '/usr/bin/rsync'
_ga_exec_rsync += --info=progress2
_ga_exec_rsync += -R
_ga_exec_rsync += -av
_ga_exec_rsync += -m
_ga_exec_rsync += --safe-links
_ga_exec_rsync += --max-size="100M"
_ga_exec_rsync += --delete
_ga_exec_rsync += $(_ga_arg1_rsync)
_ga_exec_rsync += "/usr/local/share/bwrapsh"
_ga_exec_rsync += "./example/"



### target
## clean
.PHONY: clean-all
clean-all:
	$(_ga_exec_clean)


## check
.PHONY: check-all
check-all:
	$(_ga_exec_checks)


## build
.PHONY: build-deb
build-deb:
	$(_ga_exec_clean)
	$(_ga_exec_mkdir)
	$(_ga_exec_version)
	$(_ga_exec_precopy)
	$(_ga_exec_checkb)
	$(_ga_exec_fdfind)
	$(_ga_exec_postcopy)
	$(_ga_exec_dpkg)
	$(_ga_exec_shasum)


## sync
.PHONY: sync-local
sync-local:
	$(_ga_exec_rsync)

