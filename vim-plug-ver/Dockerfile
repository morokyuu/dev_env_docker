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

USER dev
WORKDIR /home/dev

# vim-plugインストール
RUN curl -fLo /home/dev/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#
RUN sudo locale-gen ja_JP.UTF-8
COPY vimrc /home/dev/.vimrc

RUN apt install -y neovim nodejs npm ripgrep && apt clean

