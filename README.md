# 概要
OpenFOAM用のコンテナ。

# how to use
openfoamを実行するためには，ユーザーが`openfoam`でなければならない。

```bash
# openfoamユーザーに切り替える
$ su openfoam
# rootにもどる
$ exit 
```


## テスト計算
drivaer(自動車のベンチマークモデル)の実行。
概略の所要時間は，8並列で，メッシング:20min，計算：2h20min。

```bash
$ cp $FOAM_TUTORIALS/incompressibleFluid/drivaerFastback/ . -r
$ cd drivaerFastback/
$ ./Allrun
```


# PyGemのインストール
モーフィングのためのライブラリ`PyGem`のインストール。
```bash
$ git clone https://github.com/mathLab/PyGeM
$ cd PyGem
$ python setup.py install
```
追加ライブラリ
```bash
$ python -m pip install vtk
```

`smithers`のインストール。
```bash
$ git clone https://github.com/mathLab/Smithers
$ python setup.py install
```

OpenFoamHandlerへのパスが変更されているらしい。以下に直す
```tutorial-6-ffd-rbf.ipynb
from smithers.io.openfoam.openfoamhandler import OpenFoamHandler
```