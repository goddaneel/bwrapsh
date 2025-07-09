### define
define _ef_rsync
$(_es_full_rsync) $(1) $@
endef



### argument
_ea_arg1_rsync ?= $(args_rsync)



### variable
## exec
_es_exec_rsync := '/usr/bin/rsync'


## args
_ea_args_rsync += --info=progress2
_ea_args_rsync += -av
_ea_args_rsync += -m
_ea_args_rsync += --max-size="100M"
_ea_args_rsync += --delete
_ea_args_rsync += $(_ea_arg1_rsync)


## full
_es_full_rsync := $(_es_exec_rsync) $(_ea_args_rsync)



### target
## sync
.PHONY: sync
sync:
	$(_es_full_rsync) "/_and/config/bwrapsh/" "./main"
