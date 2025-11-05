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
├── default
│   ├── bwrapsh_dbusproxy
│   └── bwrapsh_flatpakx11
├── desktop
│   ├── FlClash.desktop
│   └── sparkle.desktop
├── desktop_flatpak
│   ├── _flatpak.desktop
│   ├── com.baidu.NetDisk.desktop
│   ├── com.discordapp.Discord.desktop
│   ├── com.heroicgameslauncher.hgl.desktop
│   ├── com.jetbrains.IntelliJ-IDEA-Community.desktop
│   ├── com.qq.QQ.desktop
│   ├── com.tencent.WeChat.desktop
│   ├── com.usebottles.bottles.desktop
│   ├── com.valvesoftware.Steam.desktop
│   ├── com.wps.Office.desktop
│   └── org.telegram.desktop.desktop
├── execute
│   ├── flclash
│   └── sparkle
├── patches_flatpak
│   └── icewm
│       ├── keys
│       ├── preferences
│       └── toolbar
├── profile
│   ├── testgr
│   ├── testgv
│   ├── testgw
│   └── testgwg
└── profile_flatpak
    ├── _l11
    ├── _l21
    ├── _l31
    ├── _l41
    ├── com.baidu.NetDisk -> ./_l41
    ├── com.jetbrains.IntelliJ-IDEA-Community
    ├── com.qq.QQ -> ./_l41
    ├── com.tencent.WeChat -> ./_l41
    ├── com.usebottles.bottles
    └── com.wps.Office -> ./_l41
```
