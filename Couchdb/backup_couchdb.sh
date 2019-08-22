#!/bin/bash
 echo "<=========================== Program by Nguyễn Anh Tuấn========================>"
DATE_STR=$(date '+%d-%b-%Y')
DATE_TIME_STR=$(date +"%d-%b-%YT%T")

URL="http://admin:123456abcA@10.10.2.212:5984"
# backup database
# db name
DB_NAME[0]="heovang_blockchain_db"
DB_NAME[1]="heovang_merchant_cms"
DB_NAME[2]="heovang_notify_db"
DB_NAME[3]="heovang_pda_db"
DB_NAME[4]="heovang_private_security_db"
DB_NAME[5]="heovang_saltstore_db"
DB_NAME[6]="heovang_transaction_log"
DB_NAME[7]="heovang_userstores_db"


#DB_NAME_LARGE[0]="heovang_merchant_cms"

for i in "${DB_NAME[@]}"
do
	mkdir -p $HOME/backup_couchdb/$DATE_STR/
	couchbackup "--url" $URL "--db" $i > $HOME"/backup_couchdb/"$DATE_STR"/"$i".json"
done

echo "Backup dữ liệu heo vang thành công: "$DATE_TIME_STR >> $HOME/backup_couchdb/log_backup.out
