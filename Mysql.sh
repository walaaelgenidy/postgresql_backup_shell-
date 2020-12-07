#!/bin/bash
 
export PATH=/bin:/usr/bin:/usr/local/bin
TODAY=$(date +"%d%b%Y")
 
DB_BACKUP_PATH='/backup/sql'
MYSQL_HOST='localhost'

MyUSER=''
MYSQL_PASSWD=''

## Number of days to keep local backup copy
BACKUP_RETAIN_DAYS=30   
 
mkdir -p ${DB_BACKUP_PATH}/${TODAY}

for DB_NAME in ${DATABASE_NAMES}
	do
		pg_dump -h ${MYSQL_HOST} -u ${MyUSER} -p ${MYSQL_PASSWD}  --db ${DB_NAME} > ${DB_BACKUP_PATH}/${TODAY}/
	done

######## Remove backups older than {BACKUP_RETAIN_DAYS} days  ########
 
DBDELDATE=$(date +"%d%b%Y" --date="${BACKUP_RETAIN_DAYS} days ago")
 
if [ ! -z ${DB_BACKUP_PATH} ]; then
      cd ${DB_BACKUP_PATH}
      if [ ! -z ${DBDELDATE} ] && [ -d ${DBDELDATE} ]; then
            rm -rf ${DBDELDATE}
      fi
fi
