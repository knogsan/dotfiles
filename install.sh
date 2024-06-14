#!/usr/bin/env bash

# 未定義な変数があったら途中で終了する
set -u

# Install oh-my-zsh
if [ -d ~/.oh-my-zsh ]; then :; else
    echo "install oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

mkdir -p $HOME/.oh-my-zsh/themes
cp -n .oh-my-zsh/themes/mytheme.zsh-theme $HOME/.oh-my-zsh/themes/mytheme.zsh-theme

if [ "$REMOTE_CONTAINERS" = true ]; then # only in .devcontianer
    chsh -s /bin/zsh
else
    cp -n .gitconfig $HOME/.gitconfig
fi

if [ -e $HOME/.zshrc ]; then
    mv $HOME/.zshrc $HOME/.zshrc_old-$(date "+%FT%T")
fi

cp .zshrc $HOME/.zshrc

# 今のディレクトリ
# dotfilesディレクトリに移動する
BASEDIR=$(dirname $0)
cd $BASEDIR

# dotfilesディレクトリにある、ドットから始まり2文字以上の名前のファイルに対して
for f in .??*; do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitconfig.local.template" ] && continue
    [ "$f" = ".gitmodules" ] && continue

    # シンボリックリンクを貼る
    ln -snfv ${PWD}/"$f" ~/
done
