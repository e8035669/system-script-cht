#!/bin/bash

apt update
apt install build-essential cmake vim-nox python3-dev
python -m pip install autopep8

pushd ${HOME}/.vim_runtime/my_plugins

git clone --recurse-submodules -j4 https://github.com/ycm-core/YouCompleteMe.git
git clone https://github.com/vim-autoformat/vim-autoformat.git
git clone https://github.com/ntpeters/vim-better-whitespace.git

pushd YouCompleteMe
python install.py --force-sudo
popd

popd

