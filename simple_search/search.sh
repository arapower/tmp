#!/bin/sh

# ### 検索スクリプト
# 
# - 検索キーワードを引数1
# - 一致したファイルIDとオフセットを出力する
# - （ファイルIDをid_infoからファイル名に置換する？）
#   - ファイル名に置換すると情報が欠落してしまうなど、もったいない
#   - この辺りが検索エンジンの向上させるポイント
#     - 検索キーワードの一致率で表示順位を変更させる
#     - 新着記事ほど上位表示させる、など
#   - このような形で締める

# - 検索キーワードを引数1
keyword="$1"
# indexディレクトリ
index_directory="./index"

# - 一致したファイルIDとオフセットを出力する

# 1. 検索キーワードからインデックスのtermを列挙する
echo "$keyword" |
sed 's/./&\n/g' |
sed -n 'N;p;D;' |
paste -d '' - - |
sed '$d' |
sed 's;^;'"$index_directory"'/;' |
# 2. 各termのインデックスファイルを突き合わせる
# cat ./index/AB |
# join - ./index/BC |
# join - ./index/CD
awk '{
    if(NR == 1){
        file = $0;
        printf "%s", "cat " file;
        next;
    }
    {
        printf "%s\n", " |";
        file = $0;
        printf "%s", "join - " file;
    }
}' |
sh
# 3. 突き合わせた結果から完全一致したもの（オフセットが連続してるもの）を抽出する
