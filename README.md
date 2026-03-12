# uup镜像自动整合

## 简介

uup-Automatic-integration 是用于本地自动下载运行 uup 脚本整合镜像，通过 version.txt 的配置内容整合对应版本

需要注意是：github actions 运行时长不能超过六小时


### 文件说明

`bin\info.cmd`: 获取最新镜像的唯一 GUID

`bin\filename.cmd`: 查询下载文件名

`bin\download.cmd`: 下载 uup 脚本

`uup-auto-run.cmd`: 主程序，用于自动下载整合

`uup-download.cmd`: 仅下载脚本不整合

`uup-query.cmd`: 查询 uup 上最新的镜像信息

`version.txt`: 要整合的镜像版本


### version.txt 示例：

```batch
28000 amd64
22631 arm64
19045 x86
......

```
