# linux_shell_mysql_backup
使用linux shell实现的mysql数据库备份
运行平台：Linux或类unix
测试平台：ubuntu server 12.04 x64
文件信息：
bat.h：数据库备份程序
db_list：待备份的数据库信息，多个数据库直接用一个空格隔开
开始遇到的麻烦:
1.使用命令mysqldump -uroot -p123456 book > book.sql的时候直接运行./bat.sh成功备份；当时加入到crontab文件之后，备份失败了；在网上也找了很久，可是都没有提到点上的，经过摸索才发现：原来登录时候使用的mysqldump时候是因为登录用户的PATH环境变量包含了mysqldump的程序的目录所以可以成功执行，但是当crontab运行的时候是不包含mysqldump程序路径的所以执行不了，这个可以通过在crontab 设置环境变量PATH=..../mysqldump目录，把mysqldump的程序目录包含进去就可以了。
2.当然可以使用我的bat.sh的里面是使用which这个家伙帮忙的，这样可以不用在crontab文件里面设置PATH了。

如果有需要linux c版的可以访问我的linux_c_mysql_backup
