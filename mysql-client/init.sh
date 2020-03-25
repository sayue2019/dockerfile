#!/bin/bash
#execute all script in specified directory
TIME=$(date "+%Y-%m-%d %H:%M:%S")
echo "${TIME} 开始运行脚本,执行目录: ${1}"
MYSQL_HOST=mysql.rdsmmwb9xnfn103.rds.gz.baidubce.com
MYSQL_USER=juhu
MYSQL_PASSWORD=willgeek1984

MYSQL_PATH=sqls/${1} #指定的目录
if [ ! -d ${MYSQL_PATH} ] ; then
    echo "${MYSQL_PATH}目录不存在，退出脚本"
    exit
fi;
#mysql -h127.0.0.1 -uroot -p12345#LC < /opt/sql/init.sql
for file in ${MYSQL_PATH}/*
do
if [ -f "$file" ] ; then
postfix=`echo $file | awk -F'.' '{print  "."$NF}'`
  if [ $postfix = ".sql" ] ; then
        echo "正在执行sql: $file"
        mysql -h${MYSQL_HOST} -u${MYSQL_USER} -p${MYSQL_PASSWORD} < $file 
  fi
fi
done
TIME=$(date "+%Y-%m-%d %H:%M:%S")
echo "${TIME} 脚本运行完成"