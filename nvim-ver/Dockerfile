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
 && rm -rf /var/lib/apt/lists/*

# ユーザー作成（rootでもいいけど一応）
RUN useradd -m dev && \
    echo "dev ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers


# 日本語使えるようにする
RUN locale-gen ja_JP.UTF-8
ENV LANG=ja_JP.UTF-8
ENV LC_ALL=ja_JP.UTF-8

#RUN apt install -y nodejs npm ripgrep && apt clean
#RUN npm install -g pyright
#RUN npm install -g typescript typescript-language-server

# Neovim（最新版）インストール
#RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz \
# && rm -rf /opt/nvim-linux-x86_64 \
# && tar -C /opt -xzf nvim-linux-x86_64.tar.gz \
# && export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

#RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz \
# && tar xzf nvim-linux64.tar.gz \
# && mv nvim-linux64 /opt/nvim \
# && ln -s /opt/nvim/bin/nvim /usr/local/bin/nvim \
# && rm nvim-linux64.tar.gz

USER dev
WORKDIR /home/dev

#RUN mkdir -p /home/dev/.config/nvim 
#COPY init.lua /home/dev/.config/nvim/init.lua




