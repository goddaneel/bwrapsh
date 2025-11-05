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

