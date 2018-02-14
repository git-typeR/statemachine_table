#!/bin/sh

#==============================================================
#
#すべての実行ファイルに入出力データをコマンドライン引数として
#自動で渡すシェルスクリプト。実行される実行ファイルは順次選択され、その実行ファイルに
#ついて入力ファイルを渡し、演算され、出力される。出力ファイルは実行ファイル毎に生成される
#出力フォルダに置かれる。
#
#事前にメインプログラムでは、入出力ファイル名をコマンドライン引数で
#渡しておけるように変更しておく。
#
#    <使い方>
#cygwinなどのunix系ターミナルコマンドが使えるソフトウェア上で
#binフォルダ内でこのファイルを実行する。
# ./exeAll_allInputData.shをターミナル上で打つ。
#   ディレクトリ構造
#   seismometer_algorithm_2v91_with_judgement--|-bin←ここに"実行ファイル"と"このファイル"を置く
#                                              |
#                                              |-inputdata ←ここに入力したいデータファイルを置く
#                                              |
#                                              |-[実行ファイル名]+outputdata←ここに出力データが置かれる。
#
#
#
#
#==============================================================

POSTSCRIPT=_outputdata
keyWord=Intensity

#.sh以外の実行ファイル名を抽出
for exeFile in `ls --hide=*.*~ |grep -v .sh`
    do
    echo $exeFile
    mkdir -p ../${exeFile}_outputdata
    echo Date: > ../${exeFile}_outputdata/${exeFile}_Result.csv
    date +%Y/%m/%d/%H:%M:%S >> ../${exeFile}_outputdata/${exeFile}_Result.csv
    echo >> ../${exeFile}_outputdata/${exeFile}_Result.csv
    echo Execute file: >> ../${exeFile}_outputdata/${exeFile}_Result.csv
    echo $exeFile >> ../${exeFile}_outputdata/${exeFile}_Result.csv
    echo >> ../${exeFile}_outputdata/${exeFile}_Result.csv
    echo Input file is following: >> ../${exeFile}_outputdata/${exeFile}_Result.csv
    echo >> ../${exeFile}_outputdata/${exeFile}_Result.csv
    
#binの位置開始して相対パスでinputdata,outputdataにアクセス。
    cd ../inputdata

#"$POSTSCRIPT"が含まれるファイル以外をファイルリストとして抽出
    for fileName in `ls | grep -v $POSTSCRIPT`
        do
        echo $fileName >> ../${exeFile}_outputdata/${exeFile}_Result.csv
        echo .././bin/$exeFile $fileName ${fileName%.csv}$POSTSCRIPT.csv
        .././bin/$exeFile $fileName ${fileName%.csv}$POSTSCRIPT.csv
    done

#出来上がった出力ファイルをoutputフォルダへ 移動
    for mvFile in `ls *${POSTSCRIPT}.csv`
        do
#        echo $mvFile
#        echo $exeFile
        echo mv $mvFile ../${exeFile}_outputdata
        mv $mvFile ../${exeFile}_outputdata
#        echo mv ../${exeFile}_outputdata/${mvFile} ${mvFile%${POSTSCRIPT}.csv}.csv

#出力されたファイル名で追加した"$POSTSCRIPT"の部分を削除したいときに以下の行をコメントインする。
#        mv ../${exeFile}_outputdata/${mvFile} ../${exeFile}_outputdata/${mvFile%${POSTSCRIPT}.csv}.csv
    done
    
#地震判定されたファイルをResult.csvに保存
    echo >> ../${exeFile}_outputdata/${exeFile}_Result.csv
    echo \*** Detected file \*** >> ../${exeFile}_outputdata/${exeFile}_Result.csv
    seekFile=`grep "$keyWord" ../${exeFile}_outputdata/*.csv |awk -F ":" '{print $1}' | uniq`
    echo -e "${seekFile}" >> ../${exeFile}_outputdata/${exeFile}_Result.csv
done
