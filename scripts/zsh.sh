#!/usr/bin/env sh

oh_my_zsh=$HOME/.oh-my-zsh
zshrc=$HOME/.zshrc
git clone https://github.com/mz026/oh-my-zsh.git $oh_my_zsh && \
cd $oh_my_zsh && git submodule init && git submodule update &&\
echo 'source $HOME/.dot_files/zshrc' >> $zshrc

