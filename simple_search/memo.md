# MEMO

2021/03/10に発表する内容を記載する。

## ライブコーディング

転置インデックス生成スクリプトと検索スクリプトをライブコーディングする

### 転置インデックス生成スクリプト

- 検索対象とするファイルを引数1
- ファイルIDを引数2
- indexディレクトリに転置インデックスファイルを生成する
- 検索対象ファイルとファイルIDの関係をid_infoファイルに出力する

### 検索スクリプト

- 検索キーワードを引数1
- 一致したファイルIDとオフセットを出力する
- （ファイルIDをid_infoからファイル名に置換する？）
  - ファイル名に置換すると情報が欠落してしまうなど、もったいない
  - この辺りが検索エンジンの向上させるポイント
    - 検索キーワードの一致率で表示順位を変更させる
    - 新着記事ほど上位表示させる、など
  - このような形で締める