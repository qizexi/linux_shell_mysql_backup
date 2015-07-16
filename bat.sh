#!/bin/sh

#移除之前的备份
rm -f /data/bat_data/*.tar.gz

#读取数据库列表信息（多个数据库直接用空格隔开）
db_list=$(cat /data/bat_data/db_list)
#保存的名字
save_name=''
#获取数据库备份命令mysqldump的完整路径
mysql_dump=$(which mysqldump)

for db_name in $db_list
do
	save_name="/data/bat_data/"$db_name"_$(date +%Y%m%d).sql"
	$mysql_dump -hlocalhost -uroot -p123456 $db_name > $save_name
done

#打包和压缩
name='/data/bat_data/mysql_'$(date +%Y%m%d)'.tar.gz'
tar -zcf $name /data/bat_data/*.sql
#删除临时的.sql文件
rm -rf /data/bat_data/*.sql
