#!/bin/bash
 
export PATH=/bin:/usr/bin:/usr/local/bin
TODAY=$(date +"%d%b%Y")
 
DB_BACKUP_PATH='/backup/sql'
MYSQL_HOST='localhost'
DBNAME = 'test'
MyUSER='testuser'
MYSQL_PASSWD='F&9+7xZ`J%AXRgf'

## Number of days to keep local backup copy
BACKUP_RETAIN_DAYS=30   
 
mkdir -p ${DB_BACKUP_PATH}/${TODAY}

for DB_NAME 
	do
		pg_dump -h ${MYSQL_HOST} -U ${MyUSER} -p ${MYSQL_PASSWD}  -d  ${DB_NAME} -f ${DB_BACKUP_PATH}/${TODAY}/${DB_NAME}.sql
	done

