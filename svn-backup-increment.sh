#!/bin/sh
#Subversion的安装目录及执行文件
SVN_HOME=/usr/bin
SVN_ADMIN=$SVN_HOME/svnadmin
SVN_LOOK=$SVN_HOME/svnlook

##配置库根目录
SVN_REPOROOT=/usr/users/ats/svn/ATSSoftDev

##增量备份文件存放路径
date=$(date '+%Y-%m-%d')
RAR_STORE=/usr/users/atsdev/svn_backup/increment/$date
if [ ! -d "$RAR_STORE" ];then
mkdir -p $RAR_STORE
fi

##日志存放目录
Log_PATH=/usr/users/atsdev/svn_backup/log
if [ ! -d "$Log_PATH" ];then
mkdir -p $Log_PATH
fi

##读取项目库列表
# cd $SVN_REPOROOT
# for name in $(ls) 
# do
# if [ ! -d "$RAR_STORE/$name" ];then
# mkdir $RAR_STORE/$name
# fi

# cd $RAR_STORE/$name
# if [ ! -d "$Log_PATH/$name" ];then
# mkdir $Log_PATH/$name
# fi

echo ******Starting backup from $date****** >> $Log_PATH/svnback.log
$SVN_LOOK youngest $SVN_REPOROOT > $Log_PATH/A.TMP
UPPER=`head -1 $Log_PATH/A.TMP`


##取出上次备份后的版本号，并做＋1处理
NUM_LOWER=`head -1 $Log_PATH/last_revision.txt`
let LOWER="$NUM_LOWER+1"

##开始做增量备份并记录$UPPER，为下次备份做准备
$SVN_ADMIN dump $SVN_REPOROOT -r $LOWER:$UPPER --incremental > $RAR_STORE/$LOWER-$UPPER.dump
rm -f $Log_PATH/A.TMP
echo $UPPER > $Log_PATH/last_revision.txt
echo ******This time we bakcup from $LOWER to $UPPER****** >> $Log_PATH/svnback.log
echo ******Back up ended****** >> $Log_PATH/svnback.log