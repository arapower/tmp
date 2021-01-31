#!/bin/sh

# ### 転置インデックス生成スクリプト
# 
# - 検索対象とするファイルを引数1
# - ファイルIDを引数2
# - indexディレクトリに転置インデックスファイルを生成する
# - 検索対象ファイルとファイルIDの関係をid_infoファイルに出力する

# - 検索対象とするファイルを引数1
target_file="$1"
# - ファイルIDを引数2
file_id="$2"
# indexディレクトリ
index_directory="./index"

# - indexディレクトリに転置インデックスファイルを生成する
# abc -> ab, bc
# ABCDE -> AB, BC, CD, DE
cat "$target_file" |
sed 's/./&\n/g' |
sed -n 'N;p;D;' |
paste -d '' - - |
sed '$d' |
sed 's/^/'"$file_id"' /' |
awk -v index_dir="$index_directory" '{
    file_id = $1;
    term = $2;
    offset = NR;
    print file_id, offset >> index_dir "/" term;
}'
