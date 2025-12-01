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


## build
_ga_exec_version += echo
_ga_exec_version += "$(_gs_build_version)"
_ga_exec_version += >
_ga_exec_version += "./dpkg/usr/share/bwrapsh/main/info/version"
_ga_exec_version += ;
_ga_exec_version += '/usr/bin/chmod'
_ga_exec_version += -v
_ga_exec_version += 0644
_ga_exec_version += "./dpkg/usr/share/bwrapsh/main/info/version"

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
_ga_exec_fdfind += ;
_ga_exec_fdfind += '/usr/bin/chmod'
_ga_exec_fdfind += -v
_ga_exec_fdfind += 0644
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


## build
.PHONY: build-deb
build-deb:
	$(_ga_exec_clean)
	$(_ga_exec_version)
	$(_ga_exec_fdfind)
	$(_ga_exec_dpkg)
	$(_ga_exec_shasum)


## sync
.PHONY: sync-local
sync-local:
	$(_ga_exec_rsync)

