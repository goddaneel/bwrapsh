# Bwrapsh
一组采用 Bash 制作的简易 [Bubblewrap（bwrap）](https://github.com/containers/bubblewrap) 启动脚本。



## 特性
### bwrapsh_dbusproxy
采用 [xdg-dbus-proxy](https://github.com/flatpak/xdg-dbus-proxy) 项目对 dbus 进行隔离。

### bwrapsh_flatpakx11
采用 Xwayland-rootful 项目对 flatpak 应用的 x11 进行隔离。



## 结构
```
./main
├── default                     # bwrapsh 核心逻辑脚本目录
│   ├── bwrapsh_dbusproxy
│   └── bwrapsh_flatpakx11
├── desktop                     # Desktop Entry 文件目录
│   └── {APPLICATION_NAME}.desktop
├── desktop_flatpak             # Desktop Entry 文件目录（Flatpak）
│   ├── _flatpak.desktop        # Desktop entry 模板
│   └── {FLATPAK_ID}.desktop
├── execute                     # 可执行脚本目录
│   └── {EXECUTE_NAME}
├── patches_flatpak             # bwrap 环境补丁
│   └── icewm                   # 用于 flatpakx11 的 icewm 配置
│       ├── keys                # 快捷键配置
│       ├── preferences         # 环境配置
│       └── toolbar             # 工具栏配置
├── profile                     # bwrapsh 前置环境
│   ├── testgr                  # 沙盒测试环境（对当前目录只读）
│   ├── testgv                  # 沙盒测试环境（对当前目录模拟可写）
│   ├── testgw                  # 沙盒测试环境（对当前目录可写）
│   └── testgwg                 # 沙盒测试环境（对当前目录可写，但 .git 目录只读）
└── profile_flatpak             # bwrapsh 前置环境（Flatpak）
    ├── _l11                    # flatpakx11 共享 x11 socket
    └── {FLATPAK_ID} -> ./_l41  # 预设 flatpakx11 配置
```


## 接口
核心逻辑脚本启动前进行配置，形式为 bash 变量。  

`_ef_load_` 前缀函数通过 `declare -fx` 配置导入。  
`_gs_` 前缀变量可直接通过 `declare -x` 或 `_ef_load_` 前缀函数配置导入。  
`_ga_` 前缀变量必须通过 `_ef_load_` 前缀函数配置导入。  
`profile` 内脚本可视为 `_ef_load` 函数直接配置导入。


### 通用
|变量|功能|
|-|-|
|``||
|||

### bwrapsh_dbusproxy
|变量|功能|
|-|-|
|``||
|`_gs_init_name`|启动软件的名称，用以 dbus-proxy socket、fake home 等的命名|
|`_gs_init_exec`|实际的 bwrap 后接可执行文件路径或名称|
|`_gs_mode_profile`|是否导入 profile 目录内配置（如果存在）|
|`_gs_mode_test`|是否以 shell 形式启动（默认 bash）|
|`_gs_part_userbus`|是否启用 user-bus proxy|
|`_gs_part_systembus`|是否启用 system-bus proxy|
|`_gs_part_home`|是否使用非临时 home 保存持久数据|
|`_gs_part_save`|是否使用非临时外接保存目录|
|`_gs_part_network`|是否启用网络连接|
|`_gs_dirs_profile`|自定义 profile 父目录路径|
|`_gs_path_profile`|自定义 profile 配置文件路径|
|`_gs_dirs_userbus`|自定义 user-bus socket 父目录路径|
|`_gs_path_userbus`|自定义 user-bus socket 配置文件路径|
|`_gs_dirs_systembus`|自定义 system-bus socket 父目录路径|
|`_gs_path_systembus`|自定义 system-bus socket 配置文件路径|
|`_gs_dirs_home`|自定义 fake home 父目录路径|
|`_gs_path_home`|自定义 fake home 配置文件路径|
|`_gs_dirs_data`|自定义 save data 父目录路径|
|`_gs_file_data`|自定义 save data 配置文件路径|
|`_gs_dirs_file`|自定义 save file 父目录路径|
|`_gs_path_file`|自定义 save file 配置文件路径|
|`_ga_arg1_userbus`||
|`_ga_arg1_systembus`||
|`_ga_arg1_bwrapsh`||
|`_ga_arg2_bwrapsh`||

### bwrapsh_flatpakx11
|变量|功能|
|-|-|
|``||
|`_gs_init_name`||
|`_gs_init_exec`||
|`_gs_init_dpi`||
|`_gs_init_geometry`||
|`_gs_mode_profile`||
|`_gs_mode_test`||
|`_gs_mode_x11`||
|`_gs_mode_killflatpak`||
|`_gs_part_xauth`||
|`_gs_part_xwayland`||
|`_gs_part_icewm`||
|`_gs_dirs_profile`||
|`_gs_path_profile`||
|`_gs_dirs_xauth`||
|`_gs_path_xauth`||
|`_gs_path_x11socket`||
|`_gi_init_x11`||
|`_ga_arg1_xauth`||
|`_ga_arg1_xwayland`||
|`_ga_arg1_bwrapicewm`||
|`_ga_arg2_bwrapicewm`||
|`_ga_arg1_flatpak`||

