# 概要
OpenFOAM用のコンテナ。

# how to use

## テスト計算
drivaer(自動車のベンチマークモデル)の実行。
概略の所要時間は，8並列で，メッシング:20min，計算：2h20min。

```bash
cp $FOAM_TUTORIALS/incompressibleFluid/drivaerFastback/ . -r
cd drivaerFastback/
./Allrun
```