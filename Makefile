### argument
_ea_arg1_rsync ?= $(args_rsync)



### variable
## array
_ea_exec_rsync += '/usr/bin/rsync'
_ea_exec_rsync += --info=progress2
_ea_exec_rsync += -av
_ea_exec_rsync += -m
_ea_exec_rsync += --safe-links
_ea_exec_rsync += --max-size="100M"
_ea_exec_rsync += --delete
_ea_exec_rsync += $(_ea_arg1_rsync)



### target
## sync
.PHONY: sync
sync:
	$(_ea_exec_rsync) "/_and/config/bwrapsh/" "./main"
