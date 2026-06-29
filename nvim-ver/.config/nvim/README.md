
# ディレクトリ構成

~/.config/nvim/
├── init.lua
└── lua/
    ├── plugins.lua
    └── lsp.lua


# ファイル構成

init.lua … 全体の入口
plugins.lua … 何を入れるか
lsp.lua … LSPをどう使うか


## ファイルの中身

init.lua　ここは司令塔だけ。
requireでこの設定をよみこめって書くだけ

lua/plugins.lua　プラグイン一覧を管理する場所になる。

lua/lsp.lua　ここはLSP関係だけ。


# LSPについて

ctagsのような役割をするためにプロジェクト全体を読み込む必要がある。
そのプロジェクトフォルダがどこから始まってるかをnvim起動時に検索していて、
目印になるものが見つからなかった場合はLSP serverが/homeを起点にするわけにはいかんがなという警告を出す。
そんなときは.gitが目印として作用する。

目印の例
Node.jsならpackage.json
pythonならpyproject.toml


