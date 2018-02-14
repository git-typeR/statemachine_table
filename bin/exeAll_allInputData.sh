#!/bin/sh

#==============================================================
#
#���ׂĂ̎��s�t�@�C���ɓ��o�̓f�[�^���R�}���h���C�������Ƃ���
#�����œn���V�F���X�N���v�g�B���s�������s�t�@�C���͏����I������A���̎��s�t�@�C����
#���ē��̓t�@�C����n���A���Z����A�o�͂����B�o�̓t�@�C���͎��s�t�@�C�����ɐ��������
#�o�̓t�H���_�ɒu�����B
#
#���O�Ƀ��C���v���O�����ł́A���o�̓t�@�C�������R�}���h���C��������
#�n���Ă�����悤�ɕύX���Ă����B
#
#    <�g����>
#cygwin�Ȃǂ�unix�n�^�[�~�i���R�}���h���g����\�t�g�E�F�A���
#bin�t�H���_���ł��̃t�@�C�������s����B
# ./exeAll_allInputData.sh���^�[�~�i����őłB
#   �f�B���N�g���\��
#   seismometer_algorithm_2v91_with_judgement--|-bin��������"���s�t�@�C��"��"���̃t�@�C��"��u��
#                                              |
#                                              |-inputdata �������ɓ��͂������f�[�^�t�@�C����u��
#                                              |
#                                              |-[���s�t�@�C����]+outputdata�������ɏo�̓f�[�^���u�����B
#
#
#
#
#==============================================================

POSTSCRIPT=_outputdata
keyWord=Intensity

#.sh�ȊO�̎��s�t�@�C�����𒊏o
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
    
#bin�̈ʒu�J�n���đ��΃p�X��inputdata,outputdata�ɃA�N�Z�X�B
    cd ../inputdata

#"$POSTSCRIPT"���܂܂��t�@�C���ȊO���t�@�C�����X�g�Ƃ��Ē��o
    for fileName in `ls | grep -v $POSTSCRIPT`
        do
        echo $fileName >> ../${exeFile}_outputdata/${exeFile}_Result.csv
        echo .././bin/$exeFile $fileName ${fileName%.csv}$POSTSCRIPT.csv
        .././bin/$exeFile $fileName ${fileName%.csv}$POSTSCRIPT.csv
    done

#�o���オ�����o�̓t�@�C����output�t�H���_�� �ړ�
    for mvFile in `ls *${POSTSCRIPT}.csv`
        do
#        echo $mvFile
#        echo $exeFile
        echo mv $mvFile ../${exeFile}_outputdata
        mv $mvFile ../${exeFile}_outputdata
#        echo mv ../${exeFile}_outputdata/${mvFile} ${mvFile%${POSTSCRIPT}.csv}.csv

#�o�͂��ꂽ�t�@�C�����Œǉ�����"$POSTSCRIPT"�̕������폜�������Ƃ��Ɉȉ��̍s���R�����g�C������B
#        mv ../${exeFile}_outputdata/${mvFile} ../${exeFile}_outputdata/${mvFile%${POSTSCRIPT}.csv}.csv
    done
    
#�n�k���肳�ꂽ�t�@�C����Result.csv�ɕۑ�
    echo >> ../${exeFile}_outputdata/${exeFile}_Result.csv
    echo \*** Detected file \*** >> ../${exeFile}_outputdata/${exeFile}_Result.csv
    seekFile=`grep "$keyWord" ../${exeFile}_outputdata/*.csv |awk -F ":" '{print $1}' | uniq`
    echo -e "${seekFile}" >> ../${exeFile}_outputdata/${exeFile}_Result.csv
done
