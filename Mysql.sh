#!/bin/bash

export PATH=/bin:/usr/bin:/usr/local/bin
TODAY=$(date +"%d%b%Y")

DB_BACKUP_PATH='/backup/sql'
MYSQL_HOST='127.0.0.1'
DB_NAME='test'
MyUSER='testuser'
MYSQL_PASSWD='F&9+7xZ`J%AXRgf'


sudo mkdir  ${DB_BACKUP_PATH}/${TODAY}
sudo -u postgres -i
psql
pg_dump -h ${MYSQL_HOST} -U ${MyUSER} -p ${MYSQL_PASSWD}  -d  ${DB_NAME} -f ${DB_BACKUP_PATH}/${TODAY}/${DB_NAME}.sql

