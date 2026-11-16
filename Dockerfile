#xqkeji 低代码开发框架运行镜像
#
# 基础镜像：php 官方镜像（php-fpm），PHP 小版本由 ARG PHP_BRANCH 决定。
# 框架扩展 xqkeji.so 直接来自本仓库工作树，构建过程不访问任何外部下载地址，
# 因此镜像里的扩展版本与当前 checkout 的 tag 严格一致。
#
# 自动构建：打 vX.Y.Z-phpA.B 形式的 tag 即由 .github/workflows/docker.yml
# 构建并发布到 Docker Hub 的 xqkeji/xqkeji（正式版标签 + latest）；
# main 分支的提交只发布 edge 标签，用于验证 Dockerfile 与工具链改动。

# 只声明给 FROM 用，故放在第一条指令；命名成 PHP_BRANCH 而不是 PHP_VERSION，
# 是因为基础镜像已自带 ENV PHP_VERSION，同名 ARG 会让 RUN 里的 ${PHP_VERSION}
# 取到基础镜像的值而不是这里传的值。
ARG PHP_BRANCH=8.5
FROM php:${PHP_BRANCH}-fpm

# 编译型扩展的依赖工具链（PIE 现场编译扩展也需要 autoconf/automake/libtool/m4）
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        autoconf \
        automake \
        libtool \
        m4 \
        pkg-config \
        gcc \
        g++ \
        make \
        git \
        unzip \
        zip \
        libpng-dev \
        libfreetype-dev \
        libjpeg-dev \
        libxml2-dev \
        libzip-dev \
        libstdc++6 \
        file \
        vim \
    ; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# CLI php.ini
RUN printf "# composer php cli ini settings\n\
date.timezone=UTC\n\
memory_limit=-1\n\
opcache.enable_cli=1\n\
" > $PHP_INI_DIR/php-cli.ini

ENV COMPOSER_ALLOW_SUPERUSER=1
ENV COMPOSER_HOME=/tmp

# Composer 不钉版本：installer 的默认通道就是最新 stable
# （官方下载页原文："By default the installer and composer self-update will
# download the latest stable version only"）。
RUN set -eux; \
    curl -fsSL --retry 3 \
        https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions \
        -o /usr/local/bin/install-php-extensions; \
    chmod +x /usr/local/bin/install-php-extensions; \
    \
    install-php-extensions \
        redis \
        zip \
        gd \
        mongodb \
        zephir_parser \
        pdo_mysql \
        sockets \
    ; \
    \
    curl -fsSL --retry 3 -o /tmp/installer.php https://getcomposer.org/installer; \
    php /tmp/installer.php --no-ansi --install-dir=/usr/bin --filename=composer; \
    composer --ansi --version --no-interaction; \
    composer diagnose || true; \
    rm -rf /tmp/*

# ---------------------------------------------------------------------------
# 安装 PIE（PHP Installer for Extensions，PECL 的官方替代工具）
# 发布页：https://github.com/php/pie/releases
# 以 PHAR 形式装到 /usr/local/bin/pie，容器内可直接用：
#   pie install <vendor>/<package>        例如 pie install xdebug/xdebug
#   pie search <term> / pie show / pie upgrade
# PIE 需要 PHP >= 8.1、zip 或 git、以及上面装好的 autoconf/automake/libtool/m4/
# make/gcc；phpize 与 php-config 由 php 官方镜像自带。
# 不钉版本：走官方 latest 端点，构建时取当时的最新 stable。
# ---------------------------------------------------------------------------
RUN set -eux; \
    curl -fsSL --retry 3 \
        "https://github.com/php/pie/releases/latest/download/pie.phar" \
        -o /usr/local/bin/pie; \
    chmod 0755 /usr/local/bin/pie; \
    pie --version

# ---------------------------------------------------------------------------
# 安装框架扩展 xqkeji
# xqkeji.so / LICENSE.md / NOTICES 都在本仓库工作树里，随 checkout 进入构建上下文，
# 不再从 gitcode 或 GitHub 归档下载（gitcode 只是国内镜像，且归档通道会按出口 IP
# 反爬，构建机上取不到包）。
# 该扩展以「双重授权」（开源免费 / 商业授权）发布，二进制内含第三方组件
# Phalcon(BSD-3-Clause) 与 Zephir(MIT)。按授权要求，分发镜像时必须保留
# LICENSE.md 与 NOTICES，故一并拷入镜像供合规查阅。
#
# 扩展目录必须用 php-config --extension-dir 取：php 官方镜像并没有
# PHP_EXTENSION_DIR 这个环境变量（翻它的 Dockerfile 只有 PHP_INI_DIR、
# PHP_VERSION 等），写成 ${PHP_EXTENSION_DIR} 会展开成空串，.so 被装到根目录 /，
# 而下面的 php -m 检查正好会把这种装法当场判失败。
# ---------------------------------------------------------------------------
COPY xqkeji.so LICENSE.md NOTICES /tmp/xqkeji/
RUN set -eux; \
    ext_dir="$(php-config --extension-dir)"; \
    install -m 0755 /tmp/xqkeji/xqkeji.so "${ext_dir}/xqkeji.so"; \
    docker-php-ext-enable xqkeji; \
    mkdir -p /usr/local/share/licenses/xqkeji; \
    cp /tmp/xqkeji/LICENSE.md /tmp/xqkeji/NOTICES /usr/local/share/licenses/xqkeji/; \
    rm -rf /tmp/xqkeji; \
    php -m | grep -iw xqkeji

# 镜像许可元数据：标注 xqkeji 扩展为双重授权（非 OSI 开源），授权全文随镜像分发。
# IMAGE_VERSION 由 CI 按「扩展版本-PHP全版本」自动传入（见 workflows/docker.yml），
# 本地直接构建时保持 dev。
ARG IMAGE_VERSION=dev
LABEL org.opencontainers.image.licenses="proprietary" \
      org.opencontainers.image.source="https://github.com/xqkeji/php-xqkeji" \
      org.opencontainers.image.version="${IMAGE_VERSION}" \
      xqkeji.license="dual: open-source(OSI) OR commercial; see /usr/local/share/licenses/xqkeji/LICENSE.md"

WORKDIR /var/www/html
CMD ["php-fpm"]
