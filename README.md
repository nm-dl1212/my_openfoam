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
概略の所要時間は，n_cores:8，mesh_size:Mの条件で，メッシング:20min，計算：2h20min。

```bash
$ cp $FOAM_TUTORIALS/incompressibleFluid/drivaerFastback/ . -r
$ cd drivaerFastback/
$ ./Allrun -c {n_cores} -m {mesh_size: S/M/L/XL}
```


# PyGemのインストール
モーフィングのためのライブラリ`PyGem`のインストール。
```bash
# vtk, smithesのインストール
python -m pip install -y vtk
python -m pip install -y git+https://github.com/mathLab/smithers.git

# pygemのインストール
git clone https://github.com/mathLab/PyGeM
cd PyGem
python setup.py install
```
チュートリアルのファイルから，OpenFoamHandlerへのパスが変更されているらしい。
以下のように修正する。
```python:tutorial-6-ffd-rbf.ipynb
from smithers.io.openfoam.openfoamhandler import OpenFoamHandler
```

OpenFoamHandlerで読み取るにはascii形式でメッシュを出力しておく必要がある。
FOAM_TUTORIALのケースだとbinaryになっているものがあるので，以下のように修正する。

```controlDict
writeFormat     ascii;
```

#メモ
そのままだとメモリのオーバーコミットが発生する
vm.overcommit_memory = 1