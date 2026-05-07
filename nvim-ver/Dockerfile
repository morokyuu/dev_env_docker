FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# 基本ツール + sudo + vim + git
RUN apt update && apt install -y \
    sudo \
    vim \
    git \
    curl \
    ca-certificates \
    locales \
 && apt clean

# ユーザー作成（rootでもいいけど一応）
RUN useradd -m dev && \
    echo "dev ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers


RUN locale-gen ja_JP.UTF-8

RUN apt install -y nodejs npm ripgrep && apt clean
RUN npm install -g pyright
RUN npm install -g typescript typescript-language-server

# Neovim（最新版）インストール
RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz \
 && tar xzf nvim-linux64.tar.gz \
 && mv nvim-linux64 /opt/nvim \
 && ln -s /opt/nvim/bin/nvim /usr/local/bin/nvim \
 && rm nvim-linux64.tar.gz

USER dev
WORKDIR /home/dev

RUN mkdir -p /home/dev/.config/nvim 
COPY init.lua /home/dev/.config/nvim/init.lua




