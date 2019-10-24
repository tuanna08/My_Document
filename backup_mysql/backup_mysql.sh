#!/bin/bash
 echo "<=========================== Program by Nguyễn Anh Tuấn========================>"
DATE_STR=$(date '+%d-%b-%Y')
DATE_TIME_STR=$(date +"%d-%b-%YT%T")

URL="http://your_account:your_pass_couchdb@your_id:5984"
# backup database
# db name
DB_NAME[0]="dbname1"
DB_NAME[1]="db_name2"
DB_NAME[2]="db_name2"
DB_NAME[3]="db_name2"
DB_NAME[4]="db_name2"
DB_NAME[5]="db_name2"
DB_NAME[6]="db_name2"
DB_NAME[7]="db_name2"


#DB_NAME_LARGE[0]="heovang_merchant_cms"

for i in "${DB_NAME[@]}"
do
	mkdir -p $HOME/backup_couchdb/$DATE_STR/
	couchbackup "--url" $URL "--db" $i > $HOME"/backup_couchdb/"$DATE_STR"/"$i".json"
done

echo "Backup dữ liệu heo vang thành công: "$DATE_TIME_STR >> $HOME/backup_couchdb/log_backup.out
