# php-xqkeji

xqkeji 低代码开发框架的 PHP C 扩展（二进制分发），包含 Windows（.dll）与 Linux（.so）平台的 PHP 扩展文件。

本仓库提供的是**框架运行所需的 PHP 扩展二进制包**；框架本体（低代码开发框架）为闭源软件。

## 许可协议（双重授权）

本项目采用**双重授权**模式，您可任选其一：

1. **开源免费授权**：若您基于本扩展开发的应用程序（用户代码）以任一
   [OSI 认证的开源许可证](https://opensource.org/licenses)（如 GPL、LGPL、AGPL、MPL、MIT、BSD、Apache 等）公开发布，
   即可**免费使用**本扩展，无需购买商业授权。
2. **商业授权**：若您的用户代码**未**以 OSI 认证开源许可证开源（例如闭源商业软件、SaaS/云服务、嵌入式产品、内部工具等任意场景），
   则必须事先与授权方签署《商业许可协议》并支付费用后方可使用。

> 完整条款以仓库根目录的 [LICENSE.md](./LICENSE.md) 为准（中英双语）。

## 如何获取商业授权

如需商业授权，请联系框架开发者（xqkeji）洽询授权范围、期限与费用。官网：https://xqkeji.cn/

## 文件说明

- `php_xqkeji.dll`：Windows 平台 PHP 扩展
- `xqkeji.so`：Linux 平台 PHP 扩展
- `LICENSE.md`：双重授权协议全文（中英双语）
- `NOTICES`：第三方开源许可声明（Phalcon / BSD 3-Clause、Zephir / MIT），随二进制包一并发放，不得移除
- `Dockerfile`：Linux 运行镜像（php-fpm + 本扩展 + Composer/PIE 等工具链）的构建文件
- `.dockerignore`：裁剪构建上下文；`.git` 有 100 多 MB（每个版本一份二进制），不排除会显著拖慢构建

## 版本标签

标签只写扩展版本，形如 `v1.2.2`，**不要再带 `-php8.5` 这类后缀**。带后缀的写法会被 Composer/Packagist 判成 `Invalid version string`（实测 `v1.2.1-php8.5`、`1.0.8-php8.5` 全部拒绝，只有 `v1.2.1` 归一化成 `1.2.1.0`），Packagist 抓取时逐个 `Skipped tag ..., invalid tag name`，这就是本包在 Packagist 注册了却零版本的原因。同一个标签要同时喂给 GitHub Release、Packagist 和 Docker 镜像发布，所以统一按最严的规则命名。

目标 PHP 小版本不再进标签名，改为写在 `Dockerfile` 里的 `ARG PHP_BRANCH=8.5`；`release.yml`（拼 zip 文件名）和 `docker.yml`（选基础镜像）都从这里取。

发一个版本的顺序：

1. 提交新的 `xqkeji.so` 与 `php_xqkeji.dll`，并把 `Dockerfile` 的 `ARG PHP_BRANCH` 改成这份二进制对应的 PHP 小版本；
2. 打标签 `v1.2.2` 并推送，自动触发三件事：GitHub Release（两个 zip，文件名里仍带 `php8.5`）、Docker 镜像（`1.2.2-php8.5.12` / `php8.5` / `latest`）、Packagist 同步（前提是该仓库的 GitHub hook 还挂在 Packagist 上）；
3. 想立刻同步 Packagist，可在 [包编辑页](https://packagist.org/packages/xqkeji/xqkeji/edit) 点一次 **Update**，抓取日志会显示在这个页面下方。

## 用 PIE 安装

- Linux：`pie install xqkeji/xqkeji`，命中本仓库 Release 的 `php_xqkeji-<版本>_php<8.5>-x86_64-linux-glibc-nts.zip`，包内根目录是 `xqkeji.so`。
- Windows：同样支持，但 PIE 在 Windows 只走预编译二进制，资产名写死为 `php_xqkeji-<版本>-<PHP小节>-nts-vs17-x86_64.zip`；当前 .dll 只有 NTS + VS17 + x64 一种构建（`support-zts: false`），ZTS 或其他编译器装不上。安装后 PIE 会落盘成 `ext/php_xqkeji.dll`，php.ini 里写 `extension=php_xqkeji.dll`。

## Docker 镜像

`.github/workflows/docker.yml` 会在发布时自动构建并推送到 Docker Hub 的 [`xqkeji/xqkeji`](https://hub.docker.com/r/xqkeji/xqkeji)，版本号全部自动推导，不需要手写：

| 触发 | 推送标签 | 用途 |
| --- | --- | --- |
| 打标签 `v1.2.2` | `1.2.2-php8.5.12`、`php8.5`、`latest` | 正式镜像。扩展版本取自标签名，PHP 小版本取自 `Dockerfile` 的 `ARG PHP_BRANCH`，末位补丁号由基础镜像实测得出 |
| `main` 分支提交 | `edge` | 验证 Dockerfile 与工具链改动，不会动 `latest` |

镜像内的 `xqkeji.so` 就是当前标签里的同一份文件，构建过程不下载任何外部扩展包；`LICENSE.md` 与 `NOTICES` 一并拷入镜像 `/usr/local/share/licenses/xqkeji/`，**不得移除**。

本地自行构建：

``` shell
git checkout v1.2.2
docker build -t xqkeji/xqkeji:local .
```

> 自动发布依赖仓库 Secrets `DOCKERHUB_USERNAME` 与 `DOCKERHUB_TOKEN`（token 需有写权限）。
> 同一版本标签可能因上游工具（Composer、PIE）发新版而被重建覆盖；要锁死某一次构建，请引用镜像 digest（`xqkeji/xqkeji@sha256:...`）而不是标签。
