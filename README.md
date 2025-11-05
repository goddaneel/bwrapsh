# Bwrapsh
一组采用 Bash 制作的简易 [Bubblewrap（bwrap）](https://github.com/containers/bubblewrap) 启动脚本。



## 特性
### bwrapsh_dbusproxy
采用 [xdg-dbus-proxy](https://github.com/flatpak/xdg-dbus-proxy) 项目对 dbus 进行隔离。

### bwrapsh_flatpakx11
采用 Xwayland-rootful 项目对 flatpak 应用的 X11 进行隔离。



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
以“启动组”即一次程序启动为单位，核心逻辑脚本启动前进行配置，形式为 bash 变量、数组和函数。  

`_ef_load_` 前缀函数通过 `declare -fx` 配置导入。  
`_gs_` 和 `_gi_` 前缀变量可直接通过 `declare -x` 或 `_ef_load_` 前缀函数配置导入。  
`_ga_` 前缀数组必须通过 `_ef_load_` 前缀函数配置导入。  
`profile` 内名为 `_gs_init_name` 的脚本可视为 `_ef_load` 函数直接配置导入相应启动组。


### 通用
|名称|功能|性质|值类型|
|-|-|-|-|
|`_gs_mode_profile`|是否导入 profile 目录内配置（如果存在），在 `_ef_load_init` 之前生效|可选|true 或 false|
|`_gs_mode_test`|是否以 shell 形式启动（默认 bash）|可选|true 或 false|
|`_gs_dirs_profile`|自定义 profile 父目录路径|可选|字符串|
|`_gs_path_profile`|自定义 profile 配置文件路径|可选|字符串|
|`_ef_load_init`|配置导入函数，位于命名与工具函数定义与所有命令之间|可选|shell 函数|


### bwrapsh_dbusproxy
必选参数1指定 `_gs_init_name`，必选参数2指定 `_gs_init_exec`。bwrap 命令接受位移2参数。  

|名称|功能|性质|值类型|
|-|-|-|-|
|`_gs_init_name`|启动组名，启动软件的名称，用以 dbus-proxy socket、fake home 等的命名|必选|字符串|
|`_gs_init_exec`|实际的 bwrap 后接可执行文件路径或名称|可选|字符串|
|`_gs_part_userbus`|是否启用 user-bus proxy|可选|true 或 false|
|`_gs_part_systembus`|是否启用 system-bus proxy|可选|true 或 false|
|`_gs_part_home`|是否使用非临时 home 保存持久数据|可选|true 或 false|
|`_gs_part_save`|是否使用非临时外接保存目录|可选|true 或 false|
|`_gs_part_network`|是否启用网络连接|可选|true 或 false|
|`_gs_dirs_userbus`|自定义 user-bus socket 父目录路径|可选|字符串|
|`_gs_path_userbus`|自定义 user-bus socket 配置文件路径|可选|字符串|
|`_gs_dirs_systembus`|自定义 system-bus socket 父目录路径|可选|字符串|
|`_gs_path_systembus`|自定义 system-bus socket 配置文件路径|可选|字符串|
|`_gs_dirs_home`|自定义 fake home 父目录路径|可选|字符串|
|`_gs_path_home`|自定义 fake home 配置文件路径|可选|字符串|
|`_gs_dirs_data`|自定义 save data 父目录路径|可选|字符串|
|`_gs_file_data`|自定义 save data 配置文件路径|可选|字符串|
|`_gs_dirs_file`|自定义 save file 父目录路径|可选|字符串|
|`_gs_path_file`|自定义 save file 配置文件路径|可选|字符串|
|`_ga_arg1_userbus`|user-bus 部分中，xdg-dbus-proxy 命令的额外参数|可选|shell 数组|
|`_ga_arg1_systembus`|system-bus 部分中，xdg-dbus-proxy 命令的额外参数|可选|shell 数组|
|`_ga_arg1_bwrapsh`|bwrapsh 部分中，bwrap 命令的额外参数，位于 `_gs_init_exec` 之前|可选|shell 数组|
|`_ga_arg2_bwrapsh`|bwrapsh 部分中，bwrap 命令的额外参数，位于 `_gs_init_exec` 之前|可选|shell 数组|
|`_ef_load_userbus`|配置导入函数，位于 userbus 部分开始|可选|shell 函数|
|`_ef_load_systembus`|配置导入函数，位于 systembus 部分开始|可选|shell 函数|
|`_ef_load_home`|配置导入函数，位于 home 部分开始|可选|shell 函数|
|`_ef_load_bwrapsh`|配置导入函数，位于 bwrapsh 部分开始|可选|shell 函数|


### bwrapsh_flatpakx11
必选参数1指定 `_gs_init_name`，必选参数2指定 `_gs_init_exec`。flatpak 命令接受位移2参数。  

|变量|功能|性质|值类型|
|-|-|-|-|
|`_gs_init_name`|启动组名目标 flatpak 应用的 ID|必选|字符串|
|`_gs_init_exec`|flatpak 参数 --command= 的值|可选|字符串|
|`_gs_init_dpi`|目标嵌套 X 窗口的 DPI|可选|字符串|
|`_gs_init_geometry`|目标嵌套 X 窗口的尺寸|可选|字符串|
|`_gs_mode_x11`|是否启用嵌套 X 窗口模式|可选|true 或 false|
|`_gs_mode_killflatpak`|脚本结束时是否执行 flatpak kill 以清理 flatpak 进程|可选|true 或 false|
|`_gs_part_xauth`|是否启用 xauth 作为嵌套 X 窗口验证方式|可选|true 或 false|
|`_gs_part_xwayland`|是否启用 Xwayland-rootful 作为嵌套 X 窗口|可选|true 或 false|
|`_gs_part_icewm`|是否在嵌套 X 窗口中启用 icewm 窗口管理器|可选|true 或 false|
|`_gs_dirs_xauth`|自定义 xauth 父目录路径|可选|字符串|
|`_gs_path_xauth`|自定义 xauth 配置文件路径|可选|字符串|
|`_gs_path_x11socket`|自定义 X11 Socket 配置文件路径|可选|字符串|
|`_gi_init_x11`|自定义嵌套 X 窗口的编号|可选|整数|
|`_ga_arg1_xauth`|xauth 部分中，xauth 命令的额外参数|可选|shell 数组|
|`_ga_arg1_xwayland`|xwayland 部分中，xwayland 命令的额外参数|可选|shell 数组|
|`_ga_arg1_bwrapicewm`|bwrap-icewm 部分中，bwrap 命令的额外参数，位于 icewm 命令之前|可选|shell 数组|
|`_ga_arg2_bwrapicewm`|bwrap-icewm 部分中，bwrap 命令的额外参数，位于 icewm 命令之后|可选|shell 数组|
|`_ga_arg1_flatpak`|flatpak 部分中，flatpak 命令的额外参数|可选|shell 数组|
|`_ef_load_xauth`|配置导入函数，位于 xauth 部分开始|可选|shell 函数|
|`_ef_load_xwayland`|配置导入函数，位于 xwayland 部分开始|可选|shell 函数|
|`_ef_load_bwrapicewm`|配置导入函数，位于 bwrapicewm 部分开始|可选|shell 函数|
|`_ef_load_flatpak`|配置导入函数，位于 flatpak 部分开始|可选|shell 函数|

