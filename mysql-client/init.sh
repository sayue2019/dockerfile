#!/bin/bash
#execute all script in specified directory
TIME=$(date "+%Y-%m-%d %H:%M:%S")
echo "${TIME} start running: ${1}"
MYSQL_HOST=mysql.rdsmmwb9xnfn103.rds.gz.mysql.com
MYSQL_USER=root
MYSQL_PASSWORD=root

MYSQL_PATH=sqls/${1} 
if [ ! -d ${MYSQL_PATH} ] ; then
    echo "${MYSQL_PATH}not this dir，exiting"
    exit
fi;
#mysql -h127.0.0.1 -uroot -p12345#LC < /opt/sql/init.sql
for file in ${MYSQL_PATH}/*
do
if [ -f "$file" ] ; then
postfix=`echo $file | awk -F'.' '{print  "."$NF}'`
  if [ $postfix = ".sql" ] ; then
        echo "exec sql: $file"
        mysql -h${MYSQL_HOST} -u${MYSQL_USER} -p${MYSQL_PASSWORD} < $file 
  fi
fi
done
TIME=$(date "+%Y-%m-%d %H:%M:%S")
echo "${TIME} Finish"