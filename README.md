# 项目简介

本固件适配斐讯 N1 主路由模式，追求精简和纯净。以下是本项目的主要特点：

## 特点

1. **固件源代码：**
   - 使用 **LEAN** 的 OpenWrt 源码，集成了一些常用插件，删除了 L 大固件默认勾选的部分插件，精简过后只保留所需功能。
  
2. **自编译脚本：**
   - 吸取了各位大佬的经验，特别解决了 action 编译过程中硬盘空间不足导致编译失败的问题。避免了走弯路，帮助后续使用者顺利编译。
  
3. **配置文件：**
   - 配置文件非常精简，可以根据需要增减所需功能。**N1 编译时必须保留的基本依赖**不做精简。

4. **编译时间：**
   - 第一次编译大约需要 **2.5小时**，第二次编译利用缓存可以节省约 **1小时**。

5. **完整支持 IPv6：**
   - 支持 IPv6 的完整功能。

6. **在线升级：**
   - 集成晶晨宝盒，可以直接在线升级 OpenWrt 版本，默认配置指向本项目的更新地址。

7. **内核升级：**
   - 内核版本更新至 **5.15.180**，详细内核信息请访问：[内核地址](https://github.com/breakingbadboy/OpenWrt/releases/)

8. **USB 网络共享：**
   - 支持通过 USB 共享手机网络。对于**ios设备**也是支持的,在ios18,ios15上测试通过 iPhone在开启个人热点时,选择仅USB 同时 设置->密码->配件 打开(关闭以避免配件在iPhone锁定超过1小时后与其连接)

## 包含的插件目录

### Luci 插件

- **luci-app-amlogic**  
- **luci-app-dockerman**  
- **luci-app-passwall**  
- **luci-app-samba4**  
- **luci-app-vlmcsd**  
- **luci-app-uhttpd**  
- **luci-app-frpc**  
- **luci-app-socat**  
- **luci-app-cifs-mount**  
- **luci-app-wol**  
- **luci-app-mosdns**  
- **luci-app-alist**  
- **luci-app-ttyd**

### 主题插件

- **luci-theme-design**  
- **luci-app-design-config**  
- **luci-theme-argon**  
- **luci-app-argon-config**

### 常用服务

- **luci-app-openvpn-server**  
- **luci-app-zerotier**

## 截图

![360截图20241105215446408](https://github.com/user-attachments/assets/5b6381d2-52d7-41d2-af12-a7ea0a6d2598)  
![360截图20241105215513569](https://github.com/user-attachments/assets/36f9febd-51bb-41d8-b119-9f9c78967e0a)

---

# 致谢

感谢以下开发者和项目的贡献：

- 代码基于 **LEAN** 的 [OpenWrt 项目](https://github.com/coolsnowwolf/lede)
- 使用 **flippy** 的 [编译脚本](https://github.com/unifreq/openwrt_packit) 和 **breakingbadboy** 维护的 [内核](https://github.com/breakingbadboy/OpenWrt/releases/tag/kernel_stable) 打包而成。
- **flippy** 固件的更多细节参考 [恩山论坛帖子](https://www.right.com.cn/forum/thread-4076037-1-1.html)。
- 原作者 **fightroad** 的 [源项目地址](https://github.com/fightroad/N1-OpenWrt)
