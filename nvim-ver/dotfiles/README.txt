
# dotfiles / setup.sh メモ

## 目的
自分の環境構築を自動化する。
特に以下を管理する。

- バイナリインストール（例: Neovim）
- 設定ファイル（dotfiles）
- シンボリックリンク作成

---

# 1. Neovimインストールスクリプト

やること:

1. tar.gzをダウンロード
2. 解凍
3. /opt/nvimへ配置
4. /usr/local/bin/nvimへsymlink作成

方針:

- 何回実行しても壊れない（冪等性）
- 途中失敗を検知する
- 既存ファイルを無駄に処理しない

使った考え方:

## ファイル存在チェック

if [[ -e "${FILE}" ]]

ファイル・ディレクトリ問わず存在確認

例:

if [[ ! -s "${ARCHIVE}" ]]; then

サイズ0ではないファイルが存在するか確認


## 拡張子除去

FILE="file.tar.gz"

NAME="${FILE%.tar.gz}"

結果:

file


## tar展開後の確認

単純にディレクトリ存在を見るだけではなく、

"${BINDIR}/bin/nvim"

が存在するか確認する。

理由:
ディレクトリだけ存在して中身が壊れているケースを検出するため。


## コピー

mvではなくcp -aを使う。

理由:

mvの場合:

nvim-linux-x86_64
    ↓
/opt/nvim/nvim-linux-x86_64

になる。

欲しい形:

/opt/nvim
├── bin
├── lib
└── share

なので、

cp -a "${BINDIR}/." "${DEST}/"

で中身だけコピーする。


## symlink

普通の:

ln -s

だと2回目実行時に失敗する。

なので:

ln -sfn

を使う。

例:

sudo ln -sfn /opt/nvim/bin/nvim /usr/local/bin/nvim


---

# 2. dotfiles管理

最初の構成:

dotfiles/
├── setup.sh
└── .config/
    └── nvim/


だった。

問題:

~/.configを直接編集すると、
git管理している場所へ戻す必要がある。

例:

編集
↓
~/.config/nvim
↓
dotfiles/.config/nvimへコピー
↓
commit


が面倒。


---

# 採用した方式

symlink方式。

リポジトリ側を実体にする。

構成:

dotfiles/
├── setup.sh
├── config/
│   ├── nvim/
│   ├── tmux/
│   └── zsh/
└── home/
    ├── .zshrc
    ├── .gitconfig
    └── .profile


配置:

dotfiles/config/nvim
        ↓
~/.config/nvim


dotfiles/home/.zshrc
        ↓
~/.zshrc


こうすると普段編集する場所がそのままgit管理対象になる。


---

# setup.shの役割

setup.shは
「ファイルをコピーする」
ではなく
「symlinkを張る」
スクリプトにする。


例:

link \
    "${DOTFILES}/config/nvim" \
    "${HOME}/.config/nvim"


結果:

~/.config/nvim
        ↓
~/dotfiles/config/nvim


---

# setup.shで考慮したこと

## 実行場所に依存しない

固定:

~/dotfiles

ではなく、

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

でスクリプト自身の場所を取得する。


これで:

~/dotfiles/setup.sh

でも

~/src/dotfiles/setup.sh

でも動く。


---

## 既存ファイル対策

例えば:

~/.zshrc

が既にある場合、

いきなり削除しない。

一旦:

~/.zshrc.bak

へ退避する。


---

# 最終的な考え方

dotfilesリポジトリ:

- config/
  - ~/.config配下へsymlink
- home/
  - ホーム直下へsymlink


setup.sh:

- install処理
- symlink作成
- 既存ファイル保護


Neovimなどのバイナリ:

- /optへ配置
- /usr/local/binへsymlink


今後追加する場合:

例:

alacritty追加:

dotfiles/config/alacritty/

を作る。

setup.shに:

link \
    "${DOTFILES}/config/alacritty" \
    "${HOME}/.config/alacritty"

を追加。


これで1リポジトリで環境管理できる。



