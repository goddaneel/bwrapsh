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
├── default                     # bwrapsh 核心逻辑脚本
│   ├── bwrapsh_dbusproxy
│   └── bwrapsh_flatpakx11
├── desktop                     # Desktop Entry 文件
│   ├── FlClash.desktop
│   └── sparkle.desktop
├── desktop_flatpak             # Desktop Entry 文件（Flatpak）
│   ├── _flatpak.desktop
│   └── {FLATPAK_ID}.desktop
├── execute                     # 可执行脚本
│   ├── flclash
│   └── sparkle
├── patches_flatpak             # bwrap 环境补丁
│   └── icewm
│       ├── keys
│       ├── preferences
│       └── toolbar
├── profile                     # bwrapsh 前置环境
│   ├── testgr
│   ├── testgv
│   ├── testgw
│   └── testgwg
└── profile_flatpak             # bwrapsh 前置环境（Flatpak）
    ├── _l11
    ├── _l21
    ├── _l31
    ├── _l41
    └── {FLATPAK_ID} -> ./_l41
```
