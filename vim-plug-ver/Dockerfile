FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# 基本ツール + sudo + vim + git
# ripgrepはgrepの進化版
RUN apt update && apt install -y \
    sudo \
    vim \
    git \
    curl \
    ca-certificates \
    locales \
    ripgrep \
 && rm -rf /var/lib/apt/lists/*

# ユーザー作成（rootでもいいけど一応）
RUN useradd -m dev && \
    echo "dev ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# 日本語使えるようにする
RUN locale-gen ja_JP.UTF-8

# user => dev (not root)
USER dev
WORKDIR /home/dev

# vim-plugインストール
RUN curl -fLo /home/dev/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# vimrcをコンテナにコピーして導入。起動したときからプラグイン導入済み
COPY vimrc /home/dev/.vimrc
RUN vim +'PlugInstall --sync' +'qa!' +qa


