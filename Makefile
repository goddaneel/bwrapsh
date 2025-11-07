### argument
## rsync
_ga_arg1_rsync ?= $(args_rsync)



### array
## rsync
_ga_exec_rsync += '/usr/bin/rsync'
_ga_exec_rsync += --info=progress2
_ga_exec_rsync += -av
_ga_exec_rsync += -m
_ga_exec_rsync += --safe-links
_ga_exec_rsync += --max-size="100M"
_ga_exec_rsync += --delete
_ga_exec_rsync += $(_ga_arg1_rsync)



### target
## sync
.PHONY: sync
sync:
	$(_ga_exec_rsync) "/_and/config/bwrapsh" "./"
