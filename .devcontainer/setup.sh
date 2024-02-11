#!/bin/bash

# pygemがなければgit cloneしてくる
directory="PyGem"
if [ ! -d "$directory" ]; then
    echo "$directory ディレクトリが存在しません。"
    git clone https://github.com/mathLab/PyGeM
fi

# pygemライブラリのセットアップ
cd PyGem
/usr/bin/python3.10 setup.py install