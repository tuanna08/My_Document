#!/bin/bash
 echo "<=========================== Program by Nguyễn Anh Tuấn========================>"
DATE_STR=$(date '+%d-%b-%Y')
DATE_TIME_STR=$(date +"%d-%b-%YT%T")

URL="http://your_account:your_pass_couchdb@your_id:5984"
# backup database
# db name
DB_NAME[0]="cinder"
DB_NAME[1]="glance"
DB_NAME[2]="keystone"
DB_NAME[3]="neutron_ml2"
DB_NAME[4]="nova"
DB_NAME[5]="nova_api"
DB_NAME[6]="nova_cell0"
DB_NAME[7]="nova_placement"


#DB_NAME_LARGE[0]="heovang_merchant_cms"

for i in "${DB_NAME[@]}"
do	
	mkdir -p $HOME/backup_mysql/$DATE_STR/
	mysqldump --databases $i > $HOME"/backup_mysql/"$DATE_STR"/"$i".sql"
	
done

echo "Backup dữ liệu heo vang thành công: "$DATE_TIME_STR >> $HOME/backup_mysql/log_backup.out
