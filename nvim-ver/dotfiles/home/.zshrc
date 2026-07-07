
eval "$(starship init zsh)"


# 少し凝った zshrcベース
# License : MIT
# http://mollifier.mit-license.org/

########################################
# 環境変数
export LANG=ja_JP.UTF-8


# 色を使用出来るようにする
autoload -Uz colors
colors

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

########################################
# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit

########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

#----------from bash ------------------
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

git config --global alias.graph "log --graph --date-order --all --pretty=format:'%h %Cred%d %Cgreen%ad %Cblue%cn %Creset%s' --date=short"
alias gg='git graph'

alias gs='git status'
alias gl='git log'
alias ga='git add'
alias gc='git commit'
alias gcl='git config --list'
alias gd='git diff'
alias gp='git push'
alias co='git checkout'


alias dc='docker container'
alias di='docker images'
alias dp='docker ps -a'
alias dr='docker container run --rm -it -v `pwd`:/share'
alias dcprune='docker container prune'
alias diprune='docker image prune'

alias vimrc='vi ~/.vimrc'
alias zshrc='vi ~/.zshrc'
alias bashrc='vi ~/.bashrc'
