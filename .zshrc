zmodload zsh/zprof

# compinitのキャッシュ化
# zstyle ':completion::init:*' cache-path ~/.zsh/cache

# 新しくインストールしたコマンドを認識させる
zstyle ":completion:*:commands" rehash 1

# 洗濯中の候補を塗りつぶす
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

# コマンドを間違った時に候補を表示してくれる
setopt correct

# 同じコマンドを連続で記録しない
setopt HIST_IGNORE_DUPS

# cdなしでディレクトリ名を直接指定して移動し、移動後自動でls -laする
setopt auto_cd
function chpwd() { ls -la }

# 削除前の確認なし
setopt RM_STAR_SILENT

# gitブランチ名の取得(プロンプトの表示で使用)
autoload -Uz vcs_info
precmd() { vcs_info }
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%b'

# ----------------------------
# Zinit
# https://github.com/zdharma-continuum/zinit
# ----------------------------
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
  [ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
  [ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# ----------------------------
# Plugin
# ----------------------------
## シンタックスハイライト
zinit ice wait'!0'; zinit load zsh-users/zsh-syntax-highlighting
## 履歴補完
zinit ice wait'!0'; zinit load zsh-users/zsh-autosuggestions

# ----------------------------
# Load seperated config files
# Path to the directory containing .zsh files
# ----------------------------
ZSH_CONFIG_DIR="$HOME/.config/zsh"
# Check if the directory exists
# if [ -d "$ZSH_CONFIG_DIR" ]; then
  # Loop through all .zsh files in the directory
  # for file in "$ZSH_CONFIG_DIR"/*.zsh; do
  for file in ".config/zsh"/*.zsh; do
    # Check if the file exists (in case there are no .zsh files)
    [ -e "$file" ] || continue
    # Source the file
    source "$file"
  done
# fi
unset file

# zprof
