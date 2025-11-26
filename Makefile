### argument
## pack
_gs_control_version := $(shell '/usr/bin/grep' "Version:" "./dpkg/DEBIAN/control")
_gs_build_version := $(subst Version: ,,$(_gs_control_version))
_gs_build_package := bwrapsh_$(_gs_build_version)_all.deb



### array
## build
_ga_exec_fdfind += cd "./dpkg"
_ga_exec_fdfind += ;
_ga_exec_fdfind += '/usr/bin/fdfind'
_ga_exec_fdfind += --strip-cwd-prefix
_ga_exec_fdfind += --type file
_ga_exec_fdfind += --exclude "DEBIAN"
_ga_exec_fdfind += --exec
_ga_exec_fdfind += '/usr/bin/shasum'
_ga_exec_fdfind += -a 256
_ga_exec_fdfind += >
_ga_exec_fdfind += "./DEBIAN/shasums"

_ga_exec_dpkg += '/usr/bin/mkdir'
_ga_exec_dpkg += -v
_ga_exec_dpkg += "./export"
_ga_exec_dpkg += ;
_ga_exec_dpkg += '/usr/bin/dpkg-deb'
_ga_exec_dpkg += --root-owner-group
_ga_exec_dpkg += --build
_ga_exec_dpkg += "./dpkg"
_ga_exec_dpkg += "./export/$(_gs_build_package)"

_ga_exec_shasum += cd "./export"
_ga_exec_shasum += ;
_ga_exec_shasum += '/usr/bin/shasum'
_ga_exec_shasum += --algorithm 512
_ga_exec_shasum += "$(_gs_build_package)"
_ga_exec_shasum += >
_ga_exec_shasum += "$(_gs_build_package).shasum"


## sync
_ga_exec_rsync += '/usr/bin/rsync'
_ga_exec_rsync += --info=progress2
_ga_exec_rsync += -av
_ga_exec_rsync += -m
_ga_exec_rsync += --safe-links
_ga_exec_rsync += --max-size="100M"
_ga_exec_rsync += --delete
_ga_exec_rsync += $(_ga_arg1_rsync)
_ga_exec_rsync += "/usr/local/share/bwrapsh"
_ga_exec_rsync += "./example/"



### target
## build
.PHONY: build-deb
build-deb:
	$(_ga_exec_fdfind)
	$(_ga_exec_dpkg)
	$(_ga_exec_shasum)


## sync
.PHONY: sync-local
sync-local:
	$(_ga_exec_rsync)

